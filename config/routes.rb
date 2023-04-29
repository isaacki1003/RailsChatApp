Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy, :create, :index]
  resources :groups do
    resources :group_users, only: [:index, :create, :destroy]
  end
  resources :messages
end
