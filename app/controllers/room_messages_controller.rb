class RoomMessagesController < ApplicationController
    before_action :params_permit

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
