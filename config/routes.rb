Rails.application.routes.draw do
  resources :users
  resources :posts do
		resources :comments, :except => [:update,:destroy]
  end

  resources :comments, :only => [:update,:destroy]
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
