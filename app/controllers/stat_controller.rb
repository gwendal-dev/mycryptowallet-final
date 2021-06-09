class StatController < ApplicationController
  def index
    require 'net/http'
    require 'json'
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
       # Stat.all.destroy_all
      stats = Stat.where(user: current_user)
      if stats != []
        stats = stats.sort_by(&:created_at)
      end

        while i >= 0
          arr_time << (Time.now.to_time.to_f * 1000) - (86400000 * i)
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

      @hide = Hide.all.last
        if @hide == nil
          @hide = Hide.new(hide: false)
           @hide.save!
        end
        i = 0
      while i < arr_time.size
        if arr_value_total[i] != 0 && arr_value_total[i] != nil
          stat = Stat.new(time: arr_time[i], position: arr_value_total[i], user: current_user)
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
