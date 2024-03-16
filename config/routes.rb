Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pickitems#index'
  resources :pickitems, only: [:index, :show, :update]
  post '/pickitems/show_by_jan', to: 'pickitems#show_by_jan', as: 'show_by_jan'
end
