class CardsController < ApplicationController
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
    @coins = Coin.all
    @apis = Api.where(user: current_user)
    i = 0
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      coin.quantity = coin.sum(params[:portfolio_id])
      if coin.quantity > 0
        url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        reponse = JSON.parse(response)
        begin
          price = reponse['data'][0]['price'].to_f
        rescue
          price = 0
        end
        coin.price = price
        begin
          change = reponse['data'][0]['percent_change_24h'].to_f
        rescue
          change = 0
        end
        coin.change = change
        @moyenne_change += change * (coin.price * coin.quantity)
        @total_value += price * coin.quantity
        i += 1 * (coin.price * coin.quantity)
      end
    end
    @moyenne_change = @moyenne_change / i.to_f
    @portfolio = Portfolio.find(params[:portfolio_id])
    @card = 1
    @positions = Position.where(portfolio_id: params[:portfolio_id])
    @hide = Hide.all.last
  end
end
