class MarketController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    i = 0
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      coin.quantity = coin.sum(params[:id])
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        marketcap = reponse['data'][0]['market_cap']
      rescue
        marketcap = 0
      end
      coin.marketcap = marketcap
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
    @coins = @coins.sort_by(&:marketcap).reverse

    @moyenne_change = @moyenne_change / i.to_f
    if Portfolio.where(user: current_user).first == nil
      @portfolio = Portfolio.new
      @portfolio.user = current_user
      @portfolio.title = "Main"
      @portfolio.save
    end
    @portfolios = Portfolio.where(user: current_user)
    @portfolio = @portfolios.first
    @positions = Position.where(portfolio: @portfolios)
  end
end
