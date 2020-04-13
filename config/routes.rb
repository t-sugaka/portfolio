Rails.application.routes.draw do
  root "restaurants#search"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants
  post 'restaurants/result', to: 'restaurants#result'

  get 'bookmarks/index'
  post '/bookmarks', to: 'bookmarks#create'
end
