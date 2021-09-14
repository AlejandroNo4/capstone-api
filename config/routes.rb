Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :registrations, only: [:create, :update, :destroy, :show]
      delete :logout, to: 'sessions#logout'
      get :logged_in, to: 'sessions#logged_in'
      root to: 'static#home'
    end
  end

end
