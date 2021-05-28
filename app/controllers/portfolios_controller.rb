class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.where(user: current_user)
    @coins = Coin.all
    @positions = Position.where(portfolio: @portfolios)
    @portfolio = Portfolio.new
  end

  def show
    @card = 0
    @portfolio = Portfolio.find(params[:id])
    @coins = Coin.all
    @total = 0
    @positions = Position.where(portfolio_id: params[:id])
    @coins.each do |coin|
      coin.quantity = coin.sum(params[:id])
      @total += coin.quantity * coin.price
    end
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
