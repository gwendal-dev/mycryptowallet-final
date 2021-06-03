class HideController < ApplicationController
  def new
    @hide = Hide.new
    @apis = Api.all
  end
  def create
    @apis = Api.all
    @hide = Hide.new(hide_params)
    @apis = Api.all
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
