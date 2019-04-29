Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :hairstyles do
    member do
      put "like", to: "hairstyles#upvote"
      put "dislike", to: "hairstyles#downvote"
    end
    resources :comments, only: :create
    resources :saved_hairstyles, only: [:update]
  end
  resources :saved_hairstyles, only: :destroy
  resources :comments, only: :destroy
  resources :hairdressers
end
