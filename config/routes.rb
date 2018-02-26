Rails.application.routes.draw do
  root 'dogs#index'
  resources :users  
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
  resources :dogs
end
