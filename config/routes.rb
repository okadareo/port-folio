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
    resources :estates, only: [:new, :create, :index]
    resources :customers, only: [:index, :update]
  end

  scope module: :customers do
    get 'estates/finish'
    resources :estates, only: [:index, :show]
    resource :customers, only: [:show]
    root to: "estates#top"
    # resource :favorite_estates, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
