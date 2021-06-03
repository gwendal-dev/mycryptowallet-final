class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @apis = Api.where(user: current_user)
    @homes = 1
    if Portfolio.where(user: current_user).first == nil
      @portfolio = Portfolio.new
      @portfolio.user = current_user
      @portfolio.title = "Main"
      @portfolio.save
    end
  end
end
