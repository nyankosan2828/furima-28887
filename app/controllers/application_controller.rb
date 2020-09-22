class ApplicationController < ActionController::Base

    before_action :basic_auth
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :first_name, :family_name, :first_name_kana, :family_name_kana, :birthday])
    end
  
    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end