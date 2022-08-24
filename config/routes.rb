Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    post "/login", to: "sessions#create"
    get "/login", to: "sessions#new"
    delete "/logout", to: "sessions#destroy"
    resources :users
    resources :account_activations, only: :edit
    resources :soccer_fields, only: %i(index show)
    resources :soccer_field_orders
    namespace :admin do
      root to: "static_pages#home"
      get "/home", to: "static_pages#home"
      get "/help", to: "static_pages#help"
      resources :soccer_fields
    end
  end
end
