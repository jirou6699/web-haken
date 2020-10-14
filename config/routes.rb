Rails.application.routes.draw do
  devise_for :users
  root "matches#index"
  resources :contacts, only: [:new, :create]
  resources :matches, only: [:show] do
    collection do
      get 'search'
    end 
  end
  resources :jobs, only: [:index, :new, :create, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
  end
end
