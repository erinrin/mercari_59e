Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
  root to: 'items#index'
  resources :users, :items
  get 'items#search' => 'items#search'
end