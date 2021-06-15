class ActualiserCoinsController < ApplicationController
  def index
    @coins = Coin.all
      @coins.each do |coin|
        begin
          url = "https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          reponse = JSON.parse(response)
          coin.volume = reponse["data"][0]["volume_24h"]
          coin.max_supply = reponse["data"][0]["max_supply"]
          coin.marketcap = reponse['data'][0]['market_cap']
          if coin.marketcap == nil
            coin.destroy
          end
          coin.price = reponse['data'][0]['price'].to_f
          coin.change = reponse['data'][0]['percent_change_24h'].to_f
          coin.save
        rescue
        end
    end
  end
end
