class ListsController < ApplicationController
  
  def index
    @list = List.new
  end
  
  def create
    @list = List.new params[:list]
    @list.created_at = Time.now
    @list.user = current_user
    @list.save
    redirect_to :action => :show, :id => @list.friendly_id
  end         
  
  def show
    @todo = Todo.new
    @list = List.where(:friendly_id => params[:id], :user_id => current_user.id).first
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end