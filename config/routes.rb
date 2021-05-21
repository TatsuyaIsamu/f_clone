Rails.application.routes.draw do
  resources :pictures
  resources :users, only: [:edit, :new, :destroy, :create, :show, :update]
end
