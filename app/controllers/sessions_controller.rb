class SessionsController < ApplicationController
  
  def create    
    auth = request.env['omniauth.auth']
    user = User.where('authentications.provider' => auth['provider'], 'authentications.uid' => auth['uid']).first
    
    unless user
      user = User.new(
        :name => auth['user_info']['name'], 
        :nickname => auth['user_info']['nickname'],
        :created_at => Time.now,
        :last_login => Time.now
      )                                                   
      user.authentications.build(
        :provider => auth['provider'],
        :uid => auth['uid'],
        :image => auth['user_info']['image'],
        :oauth_token => auth['credentials']['token'],
        :oauth_token_secret => auth['credentials']['secret']
      )
      user.save!
    else
      user.update_attributes!(:last_login => Time.now)
    end
    
    session[:user_id] = user.id
    redirect_to root_path
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  def failure
  end
  
end