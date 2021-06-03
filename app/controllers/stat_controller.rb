class StatController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    i = 0
    @moyenne_change = 0
    @total_value = 0
    @quantity_total = 0
    portfolio = Portfolio.where(user: current_user).first
    @positions = Position.where(portfolio: portfolio)
    sum = 0
    j = 0
    @coins.each do |coin|
      coin.quantity = coin.sum(portfolio.id)
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
      @positions.each do |position|
        if position.coin == coin && position.price_entry != nil && position.quantity > 0
          sum += position.price_entry
          j += 1
        end
      end
      if j != 0
        @result = (coin.price) - (sum / j)
      end
      end
    end
    if @quantity_total == 0
      @moyenne_change = 0
    else
      @moyenne_change = @moyenne_change / i.to_f
    end
    @card = 0
    @hide = Hide.all.last
  end
end
