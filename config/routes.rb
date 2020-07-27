Rails.application.routes.draw do

  devise_for :appusers
	root 'pages#home'
	get 'pages/home', to: 'pages#home'

	resources :appusers
	resources :projects do 
    resources :bugs, only: [:new, :create]
  end
  resources :bugs, except: [:new, :create]
	# get '/login', to: 'sessions#new'
 #    post '/login', to: 'sessions#create'
 #    delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
