class AlertsController < ApplicationController
  def index
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

    @portfolio = Portfolio.where(user: current_user).first
      @coins = Coin.all
      price = 0
      @alerts = Alert.where(user_id: current_user.id)
      @alerts.each do |alert|
        @coins.each do |coin|
          if alert.coin != nil
            if coin.title == alert.coin.upcase
              coin.quantity = coin.sum(params[:id])
              url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
              uri = URI(url)
              response = Net::HTTP.get(uri)
              reponse = JSON.parse(response)
              price = reponse['data'][0]['price'].to_f
              coin.price = price
            end
          end
        end
      end

      @apis = Api.where(user: current_user)
  end

  def show
  end

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
    @alert = Alert.new
    @apis = Api.where(user: current_user)
  end

  def create
    require 'net/http'
    require 'json'
    @coins = Coin.all
    price = 0
    @alert = Alert.new(alert_params)
      @coins.each do |coin|
        if coin.title == params[:alert][:coin].upcase
          coin.quantity = coin.sum(params[:id])
          url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          reponse = JSON.parse(response)
          price = reponse['data'][0]['price'].to_f
          @alert.price = price
        end
      end
    @coins = Coin.all
    price = 0
    alerts = Alert.all
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
        end
      elsif alert.price > alert.value
        if alert.new_price <= alert.value
          alert.alert = true
        end
      end
    end
    @apis = Api.where(user: current_user)
    @alert.user_id = current_user.id
    if @alert.save
      redirect_to alerts_path
    else
      render :new
    end
  end

  def edit
    alerts = Alert.all
    alerts.each do |alert|
      if alert.price < alert.value
        if alert.price >= alert.value
          alert.alert = true
        end
      elsif alert.price > alert.value
        if alert.price <= alert.value
          alert.alert = true
        end
      end
    end
    @alert = Alert.find(params[:id])
    @apis = Api.where(user: current_user)
  end

  def update
    alerts = Alert.all
    alerts.each do |alert|
      if alert.price < alert.value
        if alert.price >= alert.value
          alert.alert = true
        end
      elsif alert.price > alert.value
        if alert.price <= alert.value
          alert.alert = true
        end
      end
    end
    @alert = Alert.find(params[:id])
    @alert.update(alert_params)
    require 'net/http'
    require 'json'
    @coins = Coin.all
    price = 0
      @coins.each do |coin|
        if coin.title == params[:alert][:coin].upcase
          coin.quantity = coin.sum(params[:id])
          url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          reponse = JSON.parse(response)
          price = reponse['data'][0]['price'].to_f
          @alert.price = price
          @alert.save
        end
      end
    redirect_to alerts_path
    @apis = Api.where(user: current_user)
  end

  private

  def alert_params
    params.require(:alert).permit(:coin, :value, :user)
  end
end
