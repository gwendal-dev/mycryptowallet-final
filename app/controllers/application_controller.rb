require 'net/https'

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  RECAPTCHA_MINIMUM_SCORE = 0.5

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def verify_recaptcha?(token, recaptcha_action)
    secret_key = Rails.application.credentials.dig(:recaptcha_secret_key)

    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{token}")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    json['success'] && json['score'] > RECAPTCHA_MINIMUM_SCORE && json['action'] == recaptcha_action
  end
end
