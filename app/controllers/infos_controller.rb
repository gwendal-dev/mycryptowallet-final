require 'json'
require 'net/http'

class InfosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @data = get_API
    @apis = Api.where(key: ENV["KEY"])
  end

  def show

  end

  private

  def get_API
    @apis = Api.where(key: ENV["KEY"])
    url = 'https://api.lunarcrush.com/v2?data=feeds&sources=news&type=chronological&key=bju9urccdhffjgowh16was'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data =JSON.parse(response)

  end
end
