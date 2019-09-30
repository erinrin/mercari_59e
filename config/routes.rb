Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
  resources :users, only: [:create, :new, :edit, :show, :upate, :destroy] do
    collection do
      get 'sign_up_select'
    end
    member do
      get 'plofile'
      get 'comfirmation'
      get 'credit'
    end
  end
  resources :items, only: [:index, :create, :new, :edit, :show, :upate, :destroy] do
    collection do
      get 'search'
    end
  end
end