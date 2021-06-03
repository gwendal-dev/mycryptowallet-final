class HideController < ApplicationController
  def new
    @hide = Hide.new
    @apis = Api.where(user: current_user)
  end
  def create
    @apis = Api.where(user: current_user)
    @hide = Hide.new(hide_params)
    if @hide.save
      redirect_to portfolios_path
    else
      render :new
    end
  end

  private

  def hide_params
    params.require(:hide).permit(:hide)
  end
end
