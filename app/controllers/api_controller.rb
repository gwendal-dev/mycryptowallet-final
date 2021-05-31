class ApiController < ApplicationController

  def index
    @portfolio = Portfolio.find(params[:portfolio_id])
    @apis = Api.all
  end

  def show
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coins = Coin.all
    @apis = Api.all
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

  def edit
    @api = Api.find(params[:id])
    @apis = Api.all
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def update
    @api = Api.find(params[:id])
    @api.update(api_params)
    redirect_to portfolio_api_index_path
    @apis = Api.all
  end

  def destroy
    @api = Api.find(params[:id])
    @api.destroy
    redirect_to portfolio_api_index_path
    @apis = Api.all
  end

  private

  def api_params
    params.require(:api).permit(:exchange, :key, :amount, :secret_key)
  end
end
