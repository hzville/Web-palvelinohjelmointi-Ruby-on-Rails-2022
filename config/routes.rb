Rails.application.routes.draw do
  root 'breweries#index'
  resources :beers
  resources :breweries
  get 'ratings', to: 'ratings#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
