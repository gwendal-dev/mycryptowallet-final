class RoomMessagesController < ApplicationController
    before_action :params_permit

    def create
    @room_message = RoomMessage.create(user: current_user,
                                           room: @room,
                                           message: params.dig(:room_message, :message))
    
    redirect_to controller: 'rooms', action: 'show', id: @room

    RoomChannel.broadcast_to(@room, @room_message)
    
    end

    private
    
    def params_permit
        @room = Room.find params.dig(:room_message, :room_id)
    end
end
