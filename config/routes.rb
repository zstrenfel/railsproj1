Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  get 'create', to: 'pokemon/new'
  resources :pokemon
  # put 'pokemon:capture', to: 'pokemon#capture', as: 'capture'
  patch 'capture', to: 'pokemon#capture'
  patch 'damage', to: 'pokemon#damage'
end
