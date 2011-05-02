class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in?
  
  protected
  
  def redirect_if_not_logged_in
    redirect_to root_path unless logged_in?
    return
  end
  
  private
  
  def current_user
    @logged_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    not current_user.nil?
  end
  
end
