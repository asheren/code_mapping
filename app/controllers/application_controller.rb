class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    auth = request.env["omniauth.auth"]
    redirect_to root_path unless auth && User.find_by_provider_and_uid(auth["provider"], auth["uid"])
  end
end
