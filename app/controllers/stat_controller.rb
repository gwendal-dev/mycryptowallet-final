class StatController < ApplicationController
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
    require 'cryptocompare'
    require 'time'
      arr_time = []
      @total_value = 0
      @arr_value_quantity = []
      arr_position = []
      @coins = Coin.all
      arr_value = []
      arr_value_total = []
      i = 10
      arr_price = []
      @portfolios = Portfolio.where(user: current_user)
      @positions = Position.where(portfolio_id: @portfolios.ids)
      @positions = @positions.sort_by(&:created_at)
        #Stat.all.destroy_all
      stats = Stat.where(user: current_user)
      if stats != []
        stats = stats.sort_by(&:created_at)
      end

        while i >= 0
          arr_time << (Time.now.to_time.to_f * 1000) - (43200000 * i)
          i -=1
        end

      i = 0

      @positions.each do |position|
          @coins.each do |coin|
            if position.coin.title == coin.title && coin.quantity == nil
              coin.quantity = coin.sum(@portfolios.first.id)
            end
        end
      end

      arr_time.each do |time|
        arr_value = []
        if stats.first != nil
        if !(stats.first.time..stats.last.time).include?(time)
        @coins.each do |coin|

          if coin.quantity != nil && coin.quantity != 0

              if !arr_time.include?(time)
                arr_time << time
              end

              stats = Stat.where(user: current_user)
              if stats != []
                stats = stats.sort_by(&:created_at)
              end

            if stats.last != nil

              price = Cryptocompare::PriceHistorical.find(coin.title, 'USD', {'ts' => (time.to_i)})[coin.title]["USD"]

              # if Stat.where(user: current_user, position: (coin.quantity * price)) == []
                arr_value << price * coin.quantity
              # end
            else
              price = Cryptocompare::PriceHistorical.find(coin.title, 'USD', {'ts' => (time.to_i)})[coin.title]["USD"]
              arr_value << price * coin.quantity
          end
          end
        end

      end

      else
        @coins.each do |coin|
          if coin.quantity != nil && coin.quantity != 0

              if !arr_time.include?(time)
                arr_time << time
              end

              stats = Stat.where(user: current_user)
              if stats != []
                stats = stats.sort_by(&:created_at)
              end

            if stats.last != nil

              price = Cryptocompare::PriceHistorical.find(coin.title, 'USD', {'ts' => (time.to_i)})[coin.title]["USD"]

              # if Stat.where(user: current_user, position: (coin.quantity * price)) == []
                arr_value << price * coin.quantity
              # end
            else
              price = Cryptocompare::PriceHistorical.find(coin.title, 'USD', {'ts' => (time.to_i)})[coin.title]["USD"]
              arr_value << price * coin.quantity
            end
          end
        end
      end
      arr_value_total << arr_value.sum
    end
      # require 'net/http'
      # require 'json'
      # require 'net/http'
      # destroy = Stat.all.destroy_all
      # arr_prices = []
      # coins_title = []
      # portfolio = Portfolio.where(user: current_user).first
      # positions = Position.where(portfolio: portfolio)
      # positions.each do |position|
      #   coins_title << position.coin.title
      #     @coins.each do |coin|
      #       if position.coin.title == coin.title
      #         coin.quantity = coin.sum(portfolio.id)
      #         coin.save
      #       end
      #   end
      # end
      # @coins = Coin.where(title: coins_title)
      # arr_value_total = []
      # arr_time_total = []
      # arr_time.each do |time|
      #   arr_value = []
      #   @coins.each do |coin|
      #     if coin.sum(portfolio.id) > 0
      #       uri = URI("https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=#{coin.title}&start=#{time.to_i}&end=#{time.to_i + 43200}")
      #       response = JSON.parse(Net::HTTP.get(uri))

      #       arr_value << response["data"][0]["close"] * coin.quantity
      #     end
      #   end
      #   arr_value_total << arr_value.sum
      # end

        # arr_value_total = arr_value_total.flatten
        @hide = Hide.all.last
        if @hide == nil
          @hide = Hide.new(hide: false)
           @hide.save!
        end
        i = 0

      while i < arr_time.size
        if arr_value_total[i] != 0 && arr_value_total[i] != nil
          stat = Stat.new(time: arr_time[i].to_i, position: arr_value_total[i], user: current_user)
          stat.save
        end
        i += 1
      end

      stats = Stat.where(user: current_user)
      if stats != []
        stats = stats.sort_by(&:created_at)
      end

      @apis = Api.where(user: current_user)
      @data = []
      stats.each do |stat|
        @data << [stat.time, stat.position]
      end
      @data = @data.sort_by(&:first)
  end
end
