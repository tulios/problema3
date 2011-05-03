class TodosController < ApplicationController
  
  before_filter :redirect_if_not_logged_in
  
  def create
    @list = List.where(:friendly_id => params[:list_id], :user_id => current_user.id).first
    @list.todos.build params[:todo]
    
    if @list.save
      render :partial => 'todos/todo.html', :locals => {:todo => @list.todos.last}
    else
      render :text => @list.errors.full_messages.join("; ")
    end
  end
  
  def update
    @list = List.where(:friendly_id => params[:list_id], :user_id => current_user.id).first
    @todo = @list.todos.find(params[:id])
    @todo.finished = @todo.finished ? false : true
    @list.save
    
    render :text => t("app.succesfully_checked")
  end
  
  def destroy
    @list = List.where(:friendly_id => params[:list_id], :user_id => current_user.id).first
    @todo = @list.todos.find(params[:id])
    
    @list.todos.delete_if{|todo| todo.id == @todo.id}
    @list.save
    
    render :text => t("app.succesfully_destroyed")
  end
  
end
