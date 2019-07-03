Rails.application.routes.draw do
  get 'album/show'
  get 'tabphotos/index'
  get 'tabphotos/show'
  get 'tabphotos/new'
  get 'tabphotos/create'
  root 'home#index'
 # get 'users/show1', to: 'users#show1'
 resources :users do |users|
   resources :album do |album|
   end
end
resources :sessions, only: [:new, :create, :destroy]
get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'
end
