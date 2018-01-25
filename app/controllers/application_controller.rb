class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include V1::ConnectionHelper





  protected

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      #puts token
      response = validate_token(token)
      @current_user = response[0]

    end
  end

  def current_user
    @current_user
  end


end
