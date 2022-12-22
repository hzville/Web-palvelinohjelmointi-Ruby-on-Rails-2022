Rails.application.routes.draw do
  root 'breweries#index'
  resources :beers
  resources :breweries
  get 'ratings', to: 'ratings#index'
  get 'ratings/new', to: 'ratings#new'

  post 'ratings', to:'ratings#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
