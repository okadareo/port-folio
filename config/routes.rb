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
    resources :estates, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :researches, only: [:index, :show] do
      patch "support"
    end
    resources :customers, only: [:index, :edit, :update] do
      patch "withdraw"
      get "researches" => "researches#index"
      resources :favorites, only:[:index]
    end
  end

  scope module: :customers do
    get "estates/finish"
    resources :estates, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      resources :researches, only: [:new, :create]
    end
    resource :customers, only: [:show]
    get "customers/unsubscribe"
    patch "customers/withdraw"
    root to: "estates#top"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
