Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
    namespace :v1 do
      resource :sessions, only: [:create, :destroy]
      resources :registrations, only: :create
      resource :users, only: [:update, :show]
      resources :places, only: [:index, :create] do
        resources :ratings, only: [:create, :index]
      end
    end
  end
end
