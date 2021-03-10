Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do

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
      get "researches/search" => "researches#search"

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

      resource :customers, only: [:show], param: :slug
      get "customers/unsubscribe", param: :slug
      patch "customers/withdraw", param: :slug
      root to: "estates#top", param: :slug
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
