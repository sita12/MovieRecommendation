Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movies#index'
  resources :reviews
  resources :movies
   resources :users
   get 'profile' => 'movies#profile'
end
