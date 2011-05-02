class ListsController < ApplicationController

  before_filter :redirect_if_not_logged_in, :except => :show
  
  def index
    @list = List.new
    @lists = current_user.lists
  end
  
  def create
    @list = List.new params[:list]
    @list.created_at = Time.now
    @list.user = current_user
    if @list.save
      render :partial => 'lists/list.html', :locals => {:list => @list}
    else
      render :text => @list.errors.full_messages.join("; ")
    end
  end         
  
  def show
    @todo = Todo.new
    if logged_in?
      @list = List.where(:friendly_id => params[:id], :user_id => current_user.id).first
    else
      user = User.where(:nickname => params[:nickname]).first
      @list = List.where(:friendly_id => params[:id], :user_id => user.id).first
    end
  end
  
  def destroy
    @list = List.where(:friendly_id => params[:id], :user_id => current_user.id).first
    @list.destroy
    
    render :nothing => true
  end
  
end