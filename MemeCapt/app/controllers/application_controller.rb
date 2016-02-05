class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def render_404
    render json: {message: "NOT FOUND"}
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by(auth_token: token) 
      unless user == nil
        if user.token_expiry.to_time < Time.now
          user.expire_token
          user == nil
        else
          user
        end
      end
    end
  end

end