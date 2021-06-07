class MarketController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.where(marketcap: nil?)
    @coins.each do |coin|
      coin.destroy
    end
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(10)
    @moyenne_change = 0
    @volume24h = 0
    @max_supply = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def create
    redirect_to search_path(params["/market"][:coins])
  end

  def search
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    coins_title = params[:format].upcase.gsub(",", "").split(" ")
    @coins = Coin.where(title: coins_title)
    @apis = Api.where(user: current_user)
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(10)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def research
    redirect_to search_path(params["/market"][:coins])
  end

  def page2
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(20)
    @coins = @coins.drop(10)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def page3
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(30)
    @coins = @coins.drop(20)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def page4
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(40)
    @coins = @coins.drop(30)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def page5
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(50)
    @coins = @coins.drop(40)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def page6
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(60)
    @coins = @coins.drop(50)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def page7
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(70)
    @coins = @coins.drop(60)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def page8
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(80)
    @coins = @coins.drop(70)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def page9
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(90)
    @coins = @coins.drop(80)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def page10
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(100)
    @coins = @coins.drop(90)
    @moyenne_change = 0
    @total_value = 0
    @coins.each do |coin|
      url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      reponse = JSON.parse(response)
      begin
        @volume24h = reponse["data"][0]["volume_24h"]
      rescue
        @volume24h = 0
      end
        coin.volume = @volume24h
      begin
        @max_supply = reponse["data"][0]["max_supply"]
      rescue
        @max_supply = 0
      end
        coin.max_supply = @max_supply
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
    end

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

  def post_page2
    redirect_to search_path(params["/market"][:coins])
  end
  def post_page3
    redirect_to search_path(params["/market"][:coins])
  end
  def post_page4
    redirect_to search_path(params["/market"][:coins])
  end
  def post_page5
    redirect_to search_path(params["/market"][:coins])
  end
  def post_page6
    redirect_to search_path(params["/market"][:coins])
  end
  def post_page7
    redirect_to search_path(params["/market"][:coins])
  end
  def post_page8
    redirect_to search_path(params["/market"][:coins])
  end
  def post_page9
    redirect_to search_path(params["/market"][:coins])
  end
  def post_page10
    redirect_to search_path(params["/market"][:coins])
  end
end
