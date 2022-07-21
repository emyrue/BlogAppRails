Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  resources :posts, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end

  root to: "users#index"
end
