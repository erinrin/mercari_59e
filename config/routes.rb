Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  root to: 'items#index'
  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'sessions'
  }
  resources :users, only: [:create, :new, :edit, :show, :update, :destroy] do
    collection do
      get 'sign_up_select'
    end
    member do
      get 'plofile'
      get 'identification'
      get 'credit'
      get 'logout'
        resources :card, only: [:new, :show] do
        collection do
          post 'show', to: 'card#show'
          post 'pay', to: 'card#pay'
          post 'delete', to: 'card#delete'
        end
      end
    end
    
  end
  resources :items, only: [:index, :create, :new, :edit, :show, :update, :destroy] do
    collection do
      get 'search'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      post 'pay/:id' => 'items#pay', as: 'pay'
      delete 'image_delete/:id' => 'items#image_delete'
    end
    
    member do
      
      get 'purchase'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end


  resources :addresses, only: [:create, :edit, :update]
end