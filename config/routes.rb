Rails.application.routes.draw do
  root 'dogs#index'
  resources :users  
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
  resources :dogs do
    member do
      put "like", to: "dogs#upvote"
      put "dislike", to: "dogs#downvote"
    end
  end
end
