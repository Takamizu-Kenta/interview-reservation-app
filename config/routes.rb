Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'top#index'
  resources :reservations, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get "confirm"
    end
  end
end
