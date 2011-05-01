class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in?
  
  private
  
  def current_user
    @logged_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    not current_user.nil?
  end
  
end
