Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: "homes#top"
    get 'home/about' => 'homes#about', as: :about
    get '/customers/information/edit'=> 'customers#edit'
    patch '/customers/update' => 'customers#update'
    resource :customers, only: [:show] do
      collection do
        get 'unsubscribe'
        patch 'withdrawal'
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
    resources :cart_items, only: [:index, :update, :destro] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :ordet_details, only: [:index, :show]
  end

  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
