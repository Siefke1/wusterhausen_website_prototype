Rails.application.routes.draw do

  # custom devise_turbo setup
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
    # get "/topics/:topic_id/offers/new", to: "offers#new", as: :new_offer
    get "topics/:topic_id/categories/:category_id/offers", to: "offers#index", as: :offer_index

  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'pages#home', as: :home
  # USER DASHBOARD
  get "/profil", to: "dashboards#show"
  get "/about", to: "pages#about"

  # NESTED ROUTES FOR TOPIC->CATEGORY->OFFERS->OFFER
  # resources :topics, only: [:index] do
  #   resources :categories, only: [:index]
  # end

  resources :topics, only: [:show, :index] do
    resources :categories, only: [:show, :index]
  end


  # UNNESTED OFFERS ROUTES
  resources :offers, only: [:show, :new, :create, :edit, :update, :delete]
  # UNNESTED CATEGORIES ROUTES
  resources :categories, only: [:new, :create]
end
