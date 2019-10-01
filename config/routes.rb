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
      get 'identification'
      get 'credit'
    end
  end
  resources :items, only: [:index, :create, :new, :edit, :show, :upate, :destroy] do
    collection do
      get 'search'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      post 'pay/:id' => 'items#pay', as: 'pay'
    end

    member do
      get 'purchase'
    end
  end
end