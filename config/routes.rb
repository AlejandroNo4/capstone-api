Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      delete :logout, to: 'sessions#logout'
      get :logged_in, to: 'sessions#logged_in'

      resources :users, only: [:create, :update, :destroy, :show]
      resources :trips, only: [:index, :create, :update, :destroy, :show]
      post "favourites", to: "favourites#create"
      get "remove_favourite", to: "favourites#destroy"

      resources :favourites, only: [:create, :destroy]
      root to: 'static#home'
    end
  end

end
