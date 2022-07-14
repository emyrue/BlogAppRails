Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:new, :create]
    end
  end

  resources :posts, only: [:new, :create]
end
