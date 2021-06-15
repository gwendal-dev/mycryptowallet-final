class MarketController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if current_user
      @alerts = Alert.where(user_id: current_user.id)
      @arr_coins = []
      @arr_alerts = []
      @arr_prices = []
      @alerts.each do |alert|
        @arr_coins << alert.coin.upcase
        @arr_alerts << alert.value
        @arr_prices << alert.price
      end
    end
      require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(200)
    # @moyenne_change = 0
    # @volume24h = 0
    # @max_supply = 0
    # @total_value = 0
    # @coins.each do |coin|
    #   url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
    #   uri = URI(url)
    #   response = Net::HTTP.get(uri)
    #   reponse = JSON.parse(response)
    #   begin
    #     @volume24h = reponse["data"][0]["volume_24h"]
    #   rescue
    #     @volume24h = 0
    #   end
    #     coin.volume = @volume24h
    #   begin
    #     @max_supply = reponse["data"][0]["max_supply"]
    #   rescue
    #     @max_supply = 0
    #   end
    #     coin.max_supply = @max_supply
    #   begin
    #     marketcap = reponse['data'][0]['market_cap']
    #   rescue
    #     marketcap = 0
    #   end
    #   coin.marketcap = marketcap
    #   begin
    #     price = reponse['data'][0]['price'].to_f
    #   rescue
    #     price = 0
    #   end
    #   coin.price = price
    #   begin
    #     change = reponse['data'][0]['percent_change_24h'].to_f
    #   rescue
    #     change = 0
    #   end
    #   coin.change = change
    #   coin.save
    #   # if coin.change != 0 && coin.marketcap != 0 && coin
    # end

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
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    redirect_to search_path(params["/market"][:coins])
  end

  def search
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
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
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    redirect_to search_path(params["/market"][:coins])
  end

  def page2
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    require 'net/http'
    require 'json'
    require 'active_support'
    extend ActionView::Helpers::NumberHelper
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(400)
    @coins = @coins.drop(200)
    # @moyenne_change = 0
    # @total_value = 0
    # @coins.each do |coin|
    #   url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
    #   uri = URI(url)
    #   response = Net::HTTP.get(uri)
    #   reponse = JSON.parse(response)
    #   begin
    #     @volume24h = reponse["data"][0]["volume_24h"]
    #   rescue
    #     @volume24h = 0
    #   end
    #     coin.volume = @volume24h
    #   begin
    #     @max_supply = reponse["data"][0]["max_supply"]
    #   rescue
    #     @max_supply = 0
    #   end
    #     coin.max_supply = @max_supply
    #   begin
    #     marketcap = reponse['data'][0]['market_cap']
    #   rescue
    #     marketcap = 0
    #   end
    #   coin.marketcap = marketcap
    #   begin
    #     price = reponse['data'][0]['price'].to_f
    #   rescue
    #     price = 0
    #   end
    #   coin.price = price
    #   begin
    #     change = reponse['data'][0]['percent_change_24h'].to_f
    #   rescue
    #     change = 0
    #   end
    #   coin.change = change
    # end

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
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    @apis = Api.where(user: current_user)
    @coins = Coin.all
    @coins = @coins.sort_by(&:marketcap).reverse
    @coins = @coins.take(600)
    @coins = @coins.drop(400)


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

  def defi
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end

    @apis = Api.where(user: current_user)
    @coins = Coin.where(title: ["UNI", "LINK","WBTC", "DAI", "AAVE", "MKR", "CAKE", "AVAX", "LUNA", "COMP", "RUNE", "YFI", "SUSHI", "SNX", "BAT", "MDX", "BNT", "BAKE", "CRV", "GRT", "ZRX", "UMA", "FTM", "ANKR", "1INCH", "REN", "USDN", "RSR", "RENBTC", "LRC", "KNC", "RLC", "REEF", "GNO", "KAVA", "OCEAN", "XVS", "OGN", "BAND", "UQC", "INJ", "REP", "NMR", "SRM", "MLN", "SXP", "ALPHA", "BAL", "AMPL", "BTS", "XHV", "DODO", "JST", "STRK", "COTI", "FEI", "FIDA", "DFI", "LUSD", "NXM", "MIR", "KEEP", "SUSD", "RAY", "TRIBE", "ALCX", "ORN", "PERP", "KSP", "WAN", "FRAX", "BADGER", "LINA", "RPL", "CREAM", "BOND", "SCRT", "LON", "POLS", "VAI", "DAO", "SWAP", "BIFI"])
    @coins = @coins.sort_by(&:marketcap).reverse

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

  def nft
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end

    @apis = Api.where(user: current_user)
    @coins = Coin.where(title: ["THETA"," XTZ", "CHZ", "ENJ", "MANA", "BAKE", "DGB", "FLOW", "OGN", "WAXP", "SAND", "OMI", "AXS", "TLM", "UOS", "CUMMIES", "SYS", "ALICE", "RFOX", "LYXe", "ERN", "CHR", "ATRI", "DVI", "GALA", "SUPER", "WHALE", "DEGO", "SLP", "FIO", "SURE", "NFT", "GET", "JGN", "RARI", "GHST", "TVK", "PNT", "XPR", "ERC20", "VISR", "ILV","DG","PYR", "COCOS", "DEP", "NFTX", "VIDT", "NIF", "SOUL", "FINE", "GAME"])
    @coins = @coins.sort_by(&:marketcap).reverse

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
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    redirect_to search_path(params["/market"][:coins])
  end
  def post_page3
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    redirect_to search_path(params["/market"][:coins])
  end
  def post_defi
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    redirect_to search_path(params["/market"][:coins])
  end
  def post_nft
    @alerts = Alert.where(user_id: current_user.id)
    @arr_coins = []
    @arr_alerts = []
    @arr_prices = []
    @alerts.each do |alert|
      @arr_coins << alert.coin.upcase
      @arr_alerts << alert.value
      @arr_prices << alert.price
    end
    redirect_to search_path(params["/market"][:coins])
  end
end
