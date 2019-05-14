Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :books, only: [ :index, :show, :create, :destroy ]
	resources :s3_signings, only: [ :index ]

	namespace :api do
		namespace :v1 do
			mount_devise_token_auth_for 'User', at: 'auth'
      resources :books, only: [ :index ]
    end
	end
end
