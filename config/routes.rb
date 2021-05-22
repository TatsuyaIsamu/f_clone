Rails.application.routes.draw do
  get '/', to: "home#top"
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
  resources :sessions,  only: [:new, :create, :destroy]
end
