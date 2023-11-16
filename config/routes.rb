Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  
  resources :users 
  resources :recipes do
    collection do
      get 'public_recipes'
      get 'private_recipes'
    end
  end
  resources :foods
  
  
  # Defines the root path route ("/")
  root "recipes#public_recipes"
end
