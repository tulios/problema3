class HomeController < ApplicationController
  
  def index
    redirect_to lists_path(:nickname => current_user.nickname) if logged_in?
  end
  
end