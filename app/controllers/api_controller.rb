class ApiController < ApplicationController

  def index
  end

  def show
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coins = Coin.all
    @apis = Api.where(key: ENV["KEY"])
    @api = Api.find(params[:id])
  end

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @api = Api.new
    @apis = Api.all
  end

  def create
    @apis = Api.all
    @portfolio = Portfolio.find(params[:portfolio_id])
    @api = Api.new(api_params)
    if @api.save!
        redirect_to portfolio_api_path(params[:portfolio_id], @api)
    else
      render :new
    end
  end

  private

  def api_params
    params.require(:api).permit(:exchange, :key, :amount, :secret_key)
  end
end
