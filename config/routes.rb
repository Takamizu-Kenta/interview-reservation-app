Rails.application.routes.draw do
  devise_for :admin_users
  root 'top#index'
  resources :reservations, only: [:index, :new, :create, :complete] do
    collection do
      get "confirm"
    end
  end
end
