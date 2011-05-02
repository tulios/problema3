Problema3::Application.routes.draw do
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/logout' => 'sessions#destroy'
  match '/:nickname' => redirect('/')
  
  scope ":nickname" do
    resources :lists, :except => [:new, :edit, :update] do
      resources :todos, :only => [:create, :update, :destroy]
    end
  end
  
  root :to => "home#index"

end
