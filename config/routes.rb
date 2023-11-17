Rails.application.routes.draw do
  # get 'public_recipes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  
  resources :users 
  resources :recipes do
    collection do
      get 'private_recipes'
    end
    resources :foods # except: [:show, :index]
    resource :shopping_cart, only: [:show] do
      post 'add_to_cart/:food_id', action: :add_to_cart, as: :add_to_cart
      delete 'remove_from_cart/:food_id', action: :remove_from_cart, as: :remove_from_cart
    end
  end
  resources :public_recipes, only: [:index]
  resources :foods
  
  
  # Defines the root path route ("/")
  root "users#index"
end
