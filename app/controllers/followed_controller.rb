class FollowedController < ApplicationController
  # require 'net/http'
  # require 'json'
  # def index
  #   @arr_time = []
  #   @total_value = 0
  #   @arr_value_quantity = []
  #   @coin = Coin.all
  #   @portfolios = Portfolio.where(user: current_user)
  #   @positions = Position.where(portfolio_id: @portfolios.id)
  #   @positions.each do |position|
  #     if position.quantity > 0
  #       @arr_time << position.entry_date
  #       url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{position.coin.title}"
  #       uri = URI(url)
  #       response = Net::HTTP.get(uri)
  #       reponse = JSON.parse(response)
  #       price = reponse['data'][0]['price'].to_f
  #       @arr_value_quantity << price * position.quantity
  #     end
  #   end
  #   end
  #   @hide = Hide.all.last
  #     if @hide == nil
  #       @hide = Hide.new(hide: false)
  #        @hide.save!
  #     end
  #   @apis = Api.where(user: current_user)
end


