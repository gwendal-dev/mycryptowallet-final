class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.where(user: current_user)
    @coins = Coin.all
    @positions = Position.where(portfolio: @portfolios)
    @portfolio = Portfolio.new
    @apis = Api.where(user: current_user)
     @hide = Hide.all.last
      if @hide == nil
        @hide = Hide.new(hide: false)
         @hide.save!
      end
  end

  def show
    require 'net/http'
    require 'json'
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    i = 0
    @moyenne_change = 0
    @total_value = 0
    @quantity_total = 0
    @coins.each do |coin|
      coin.quantity = coin.sum(params[:id])
      if coin.quantity > 0
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      price = reponse['data'][0]['price'].to_f
      coin.price = price
      change = reponse['data'][0]['percent_change_24h'].to_f
      coin.change = change
      @moyenne_change += change * (coin.price * coin.quantity)
      @total_value += price * coin.quantity
      i += 1 * (coin.price * coin.quantity)
      @quantity_total += coin.quantity
      end
    end
    if @quantity_total == 0
      @moyenne_change = 0
    else
      @moyenne_change = @moyenne_change / i.to_f
    end
    @card = 0
    @portfolio = Portfolio.find(params[:id])
    @positions = Position.where(portfolio_id: params[:id])
    @hide = Hide.all.last
      if @hide == nil
        @hide = Hide.new(hide: false)
         @hide.save!
      end
  end

  def new
    @portfolio = Portfolio.new
    @apis = Api.where(user: current_user)
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    @apis = Api.where(user: current_user)
    if @portfolio.save
      redirect_to portfolios_path
    else
      render :index
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    @apis = Api.where(user: current_user)
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    @portfolio.update(portfolio_params)
    redirect_to portfolios_path
    @apis = Api.where(user: current_user)
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to portfolios_path
    @apis = Api.where(user: current_user)
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:coin, :entry_date, :amount, :quantity, :exit_date, :exchange, :title)
  end
end
