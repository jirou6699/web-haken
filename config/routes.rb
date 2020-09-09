Rails.application.routes.draw do
  root "matches#index"
  resources :matches, only: [:show]
  resources :jobs, only: [:index, :new, :create, :destroy, :edit, :update]
end
