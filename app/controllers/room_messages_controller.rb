class RoomMessagesController < ApplicationController
    before_action :params_permit

    def create
        
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
