Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :registrations, only: :create
      resources :users, only: [:update, :index]
      resources :places, only: [:index, :create] do
        resources :ratings, only: [:create, :index]
      end
    end
  end
end
