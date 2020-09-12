Rails.application.routes.draw do
  devise_for :users
  root "matches#index"
  resources :matches, only: [:show] do
    resources :reviews, only: [:create]
    collection do
      get 'search'
    end 
  end
  resources :jobs, only: [:index, :new, :create, :destroy, :edit, :update]
end
