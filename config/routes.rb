Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :books, only: [ :index, :show, :create, :destroy ]

	namespace :api do
		scope :v1 do
			mount_devise_token_auth_for 'User', at: 'auth'
		end
	end
end
