Rails.application.routes.draw do
  root "jobs#index"
  resources :jobs, only: [:new, :create, :destroy, :edit, :update]
end
