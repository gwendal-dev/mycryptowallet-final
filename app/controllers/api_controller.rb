class ApiController < ApplicationController

  def index
    @apis = Api.all
  end

  def show
    @coins = Coin.all
    @apis = Api.all
    @api = Api.find(params[:id])
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
      @quantity_total += coin.quantity
      end
    end
    @hide = Hide.all.last
  end

  def new
    @api = Api.new
    @apis = Api.all
  end

  def create
    @apis = Api.all
    @api = Api.new(api_params)
    if @api.save!
        redirect_to api_path(@api)
    else
      render :new
    end
  end

  def edit
    @api = Api.find(params[:id])
    @apis = Api.all
  end

  def update
    @api = Api.find(params[:id])
    @api.update(api_params)
    redirect_to api_index_path
    @apis = Api.all
  end

  def destroy
    @api = Api.find(params[:id])
    @api.destroy
    redirect_to api_index_path
    @apis = Api.all
  end

  private

  def api_params
    params.require(:api).permit(:exchange, :key, :amount, :secret_key)
  end
end
