class TodosController < ApplicationController
  
  def create
    @list = List.where(:friendly_id => params[:list_id], :user_id => current_user.id).first
    @list.todos.build params[:todo]
    @list.save
    redirect_to :controller => :lists, :action => :show, :id => @list.friendly_id
  end
  
end
