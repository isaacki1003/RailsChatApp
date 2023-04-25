Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update, :destroy, :create, :index]
  resources :groups do
    resources :group_users, only: [:index, :create, :destroy]
  end
  resources :messages
end
