Rails.application.routes.draw do
  devise_for :users
  get "/users/sign_out", to: "sessions#destroy"

  resource :dashboard, only: [ :show ]

  namespace :admin do
    resources :properties
    resources :property_standard_items, except: [ :show ]
    resources :property_situations, except: [ :show ]
    resources :property_types, except: [ :show ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "/favicon.ico", to: "application#favicon"
  get "/static/avatars/:id.jpg", to: "avatars#show"

  # Defines the root path route ("/") - Daniel alterou aqui embaixo.
  root "dashboards#go_to_home"
end
