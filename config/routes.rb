Rails.application.routes.draw do
  get 'sessions/new'
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
  resorces :sessions,  only: [:new, :create, :destrory]
end
