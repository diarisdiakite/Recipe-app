Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/users/:id", to "users#show"
  
  resources :users do
    resources :recipes , only: [:index, :new, :create, :show] do
      member do
        post 'like'
      end
    end
    resources :foods , only: [:index, :new, :create, :show]
  end
  
  # Defines the root path route ("/")
  root "recipes#index"
end
