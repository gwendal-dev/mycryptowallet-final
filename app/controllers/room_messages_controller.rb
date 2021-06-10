class RoomMessagesController < ApplicationController
    before_action :params_permit

    def create
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
    apis = Api.where(user: current_user)
    @room_message = RoomMessage.create(user: current_user,
    room: @room,
    message: params.dig(:room_message, :message))
    
    head :ok                                     
    RoomChannel.broadcast_to(@room, @room_message)
    
    #redirect_to controller: 'rooms', action: 'show', id: @room
    
    end

    private
    
    def params_permit
        @room = Room.find params.dig(:room_message, :room_id)
    end
end
