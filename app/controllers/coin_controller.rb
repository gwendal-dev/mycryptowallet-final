class CoinController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @coin = Coin.where(title: params[:format])
  end
end
