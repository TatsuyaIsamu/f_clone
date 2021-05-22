Rails.application.routes.draw do
  resources :pictures
  resources :users, only: [:edit, :new, :destroy, :create, :show, :update] do
      collection do
        post :confirm
     end
      member do
        patch :confirm
        post :confirm
      end
  end
  resources :sessions,  only: [:new, :create, :destrory]
end
