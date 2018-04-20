Rails.application.routes.draw do

  # get 'users/new'

  # get 'users/create'
  	resources :pictures do 
  		resource :users, only: [:new, :create]
  	end 

	root 'pictures#index'

	# get 'pictures' => 'pictures#index'

	# post 'pictures' => 'pictures#create'
	# get 'pictures/new' => 'pictures#new'

	# get 'pictures/:id' => 'pictures#show'

	# delete 'pictures/:id' => 'pictures#destroy'

	# get 'pictures/:id/edit' => 'pictures#edit'
	# patch 'pictures/:id' => 'pictures#update'
end
