Rails.application.routes.draw do

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'
  resource :sessions, only: [:new, :create, :destroy]
  # get 'users/new'

  # get 'users/create'
  	resources :pictures
  	
  	resource :users, only: [:new, :create]
  	 

	root 'pictures#index'

	# get 'pictures' => 'pictures#index'

	# post 'pictures' => 'pictures#create'
	# get 'pictures/new' => 'pictures#new'

	# get 'pictures/:id' => 'pictures#show'

	# delete 'pictures/:id' => 'pictures#destroy'

	# get 'pictures/:id/edit' => 'pictures#edit'
	# patch 'pictures/:id' => 'pictures#update'
end
