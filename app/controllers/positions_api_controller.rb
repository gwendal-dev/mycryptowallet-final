class PositionsApiController < ApplicationController
  def new
    require 'net/http'
    require 'json'
    @coins = Coin.all
    price = 0
    alerts = Alert.all
    @arr_alert = []
    alerts.each do |alert|
      @coins.each do |coin|
        if coin.title == alert.coin.upcase
          coin.quantity = coin.sum(params[:id])
          url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          reponse = JSON.parse(response)
          price = reponse['data'][0]['price'].to_f
          alert.new_price = price
          alert.save
        end
      end

      if alert.price < alert.value
        if alert.new_price >= alert.value
          alert.alert = true
          alert.save
          @arr_alert << [alert.alert, alert.user_id]
        end
      elsif alert.price > alert.value
        if alert.new_price <= alert.value
          alert.alert = true
          alert.save
          @arr_alert << [alert.alert, alert.user_id]
        end
      end
    end
    @user_id = current_user.id
    @api = Api.find(params[:api_id])
    @position = Position.new
    @coins = Coin.all
    @apis = Api.where(user: current_user)
  end

  def create
    require 'net/http'
    require 'json'
    @coins = Coin.all
    price = 0
    alerts = Alert.all
    @arr_alert = []
    alerts.each do |alert|
      @coins.each do |coin|
        if coin.title == alert.coin.upcase
          coin.quantity = coin.sum(params[:id])
          url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          reponse = JSON.parse(response)
          price = reponse['data'][0]['price'].to_f
          alert.new_price = price
          alert.save
        end
      end

      if alert.price < alert.value
        if alert.new_price >= alert.value
          alert.alert = true
          alert.save
          @arr_alert << [alert.alert, alert.user_id]
        end
      elsif alert.price > alert.value
        if alert.new_price <= alert.value
          alert.alert = true
          alert.save
          @arr_alert << [alert.alert, alert.user_id]
        end
      end
    end
    @user_id = current_user.id
    @apis = Api.where(user: current_user)
    @api = Api.find(params[:api_id])
    @position = Position.new(position_params)
    @position.api_id = @api.id
    @coin = Coin.find(params[:position][:coin])
    @portfolio = Portfolio.first
    @position.portfolio = @portfolio
    @position.coin = @coin
    if params[:api] == 1
      if @position.save!
        redirect_to api_path(params[:api_id])
      else
        render :new
      end
    else
      if @position.save!
        redirect_to portfolios_path
      else
        render :new
      end
    end
  end

  def destroy
    require 'net/http'
    require 'json'
    @coins = Coin.all
    price = 0
    alerts = Alert.all
    @arr_alert = []
    alerts.each do |alert|
      @coins.each do |coin|
        if coin.title == alert.coin.upcase
          coin.quantity = coin.sum(params[:id])
          url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          reponse = JSON.parse(response)
          price = reponse['data'][0]['price'].to_f
          alert.new_price = price
          alert.save
        end
      end

      if alert.price < alert.value
        if alert.new_price >= alert.value
          alert.alert = true
          alert.save
          @arr_alert << [alert.alert, alert.user_id]
        end
      elsif alert.price > alert.value
        if alert.new_price <= alert.value
          alert.alert = true
          alert.save
          @arr_alert << [alert.alert, alert.user_id]
        end
      end
    end
    @user_id = current_user.id
    @apis = Api.where(user: current_user)
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to portfolio_path(:portfolio_id)
  end

  def position_params
    params.require(:position).permit(:coin_id, :entry_date, :quantity, :exit_date, :exchange, :portfolio, :card, :index)
  end
end
