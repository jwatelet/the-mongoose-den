Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"

  resources :posts do
    resources :comments, only: %i[new create], module: "posts"
    resources :likes, only: %i[create destroy], shallow: true, module: "posts"
  end

  get "posts/filter/:filter" => "posts#index", as: :filtered_posts

  resources :users, only: %i[index show edit update] do
    resources :follows, only: %i[index create destroy] do
      collection do
        get :followers
        get :followed_users
      end
    end
  end
end
