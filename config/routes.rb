Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    registrations: "admins/registration"
  }
  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    passwords: "customers/passwords",
    registrations: "customers/registrations"
  }

  namespace :admins do
    resources :calendars, only: [:create, :index, :show, :update, :destroy]
    resources :estates, only: [:new, :create, :index, :show, :edit, :update] do
      patch "destroy"
    end
    resources :researches, only: [:index, :show] do
      patch "support"
    end
    get "researches/search"

    resources :customers, only: [:index, :edit, :update] do
      patch "withdraw"
      resources :researches, only:[:index]
      resources :favorites, only:[:index]
    end
  end

  scope module: :customers do
    get "estates/finish"

    get "estates/:estate_id/new" => "estates#new", as: 'estate_new'
    post "estates/:estate_id" => "estates#create", as: 'estate_create'
    resources :estates, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end

    resource :customers, only: [:show]
    get "customers/unsubscribe"
    patch "customers/withdraw"
    root to: "estates#top"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
