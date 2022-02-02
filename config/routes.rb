Rails.application.routes.draw do

  # custom devise_turbo setup
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'pages#home'
  # USER DASHBOARD
  get "/profil", to: "dashboards#show"

  # NESTED ROUTES FOR TOPIC->CATEGORY->OFFERS->OFFER
  resources :topics, only: [:index, :show] do
    resources :categories, only: [:index, :show] do
      resources :offers, only: [:index, :show]
    end
  end
  # UNNESTED OFFERS ROUTES
  resources :offers, only: [:new, :create, :edit, :update, :delete]
  # UNNESTED CATEGORIES ROUTES
  resources :categories, only: [:new, :create]
end
