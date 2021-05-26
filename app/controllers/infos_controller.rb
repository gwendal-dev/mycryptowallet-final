require 'json'
require 'net/http'

class InfosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @data = get_API
  end

  def show

  end

  private

  def get_API

    url = 'https://api.lunarcrush.com/v2?data=feeds&sources=news&type=chronological&key=bju9urccdhffjgowh16was'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data =JSON.parse(response)

  end
end
