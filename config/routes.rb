Rails.application.routes.draw do
  # namespace :api do
  #   namespace :v1 do
  #     get 'comments/index'
  #     get 'comments/create'
  #     get 'users/index'
  #     get 'users/show'
  #     get 'posts/index'
  #     get 'posts/show'
  #   end
  # end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end

  # API ROUTES
  namespace :api do # /api
    namespace :v1 do # /api/v1
      resources :users do # api/v1/users
        resources :posts, format: :json do # api/v1/users/:user_id/posts
          resources :comments, format: :json # api/v1/users/:user_id/posts/:post_id/comments
        end
      end
    end
  end
end
