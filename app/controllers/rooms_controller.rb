class RoomsController < ApplicationController
   before_action :load_entities

    def index
      @alerts = Alert.where(user_id: current_user.id)
      @arr_coins = []
      @arr_alerts = []
      @arr_prices = []
      @alerts.each do |alert|
        @arr_coins << alert.coin.upcase
        @arr_alerts << alert.value
        @arr_prices << alert.price
      end
        @rooms = Room.all
        @apis = Api.where(user: current_user)
    end

    def new
      @alerts = Alert.where(user_id: current_user.id)
      @arr_coins = []
      @arr_alerts = []
      @arr_prices = []
      @alerts.each do |alert|
        @arr_coins << alert.coin.upcase
        @arr_alerts << alert.value
        @arr_prices << alert.price
      end
        @room = Room.new
        @apis = Api.where(user: current_user)
    end
    
    def show
      @alerts = Alert.where(user_id: current_user.id)
      @arr_coins = []
      @arr_alerts = []
      @arr_prices = []
      @alerts.each do |alert|
        @arr_coins << alert.coin.upcase
        @arr_alerts << alert.value
        @arr_prices << alert.price
      end
      @room_message = RoomMessage.new room: @room
      @room_messages = @room.room_messages.includes(:user)
      @apis = Api.where(user: current_user)
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
    end

    def def update
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
