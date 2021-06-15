class CardsApiController < ApplicationController
  def index
    @api = Api.find(params[:api_id])
  end
end
