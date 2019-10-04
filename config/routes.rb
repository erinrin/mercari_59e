Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
  resources :users, only: [:create, :new, :edit, :show, :update, :destroy] do
    collection do
      get 'sign_up_select'
    end
    member do
      get 'plofile'
      get 'identification'
      get 'credit'
    end
  end
  resources :items, only: [:index, :create, :new, :edit, :show, :update, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :addresses, only: [:create, :edit, :update]
end