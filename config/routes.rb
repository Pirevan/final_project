Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
  	resources :tasks do
  		collection do 
  			get :search
  		end
  	end
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  get "/sign_out" => "sessions#destroy", as: "sign_out"
  post "/sessions" => "sessions#create"

  root "welcome#index"

  get 'braintree/new'
  post 'braintree/checkout'

  
end
