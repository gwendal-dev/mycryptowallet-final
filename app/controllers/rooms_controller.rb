class RoomsController < ApplicationController
   before_action :load_entities

    def index
        @rooms = Room.all
        @apis = Api.where(user: current_user)
    end

    def new
        @room = Room.new
        @apis = Api.where(user: current_user)
    end
    
    def show
        @room_message = RoomMessage.new room: @room  
        @room_messages = @room.room_messages.includes(:user)
        @apis = Api.where(user: current_user)
    end

    def create
      @apis = Api.where(user: current_user)
        @room = Room.new(permitted_params)
        if @room.save
          flash[:success] = "Room successfully created"
          redirect_to rooms_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def edit
      @apis = Api.where(user: current_user)
    end

    def def update
      @apis = Api.where(user: current_user)
        if @room.update_attributes(permitted_params)
          flash[:success] = "Room #{@room.name} was updated successfully"
          redirect_to rooms_path
        else
          flash[:error] = "Something went wrong"
          render :new
        end
    end
    
    private
    def load_entities
        @rooms = Room.all
        @room = Room.find(params[:id]) if params[:id]
    end

    def permitted_params
        params.require(:room).permit(:name)
    end
end
