class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.where(user: current_user)
    @coins = Coin.all
    @positions = Position.where(portfolio: @portfolios)
    @portfolio = Portfolio.new
  end

  def show
    require 'net/http'
    require 'json'
    @coins = Coin.all
    i = 0
    @moyenne_change = 0
    @total_value = 0
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
      end
    end
    @moyenne_change = @moyenne_change / i.to_f
    @card = 0
    @portfolio = Portfolio.find(params[:id])
    @positions = Position.where(portfolio_id: params[:id])
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    if @portfolio.save
      redirect_to portfolios_path
    else
      render :index
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    @portfolio.update(portfolio_params)
    redirect_to portfolios_path
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to portfolios_path
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:coin, :entry_date, :amount, :quantity, :exit_date, :exchange, :title)
  end
end
