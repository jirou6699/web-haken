Rails.application.routes.draw do
  root "matches#index"
  resources :matches, only: [:show] 
  resources :jobs, only: [:new, :create, :destroy, :edit, :update]
end
