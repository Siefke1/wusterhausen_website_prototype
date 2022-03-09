Rails.application.routes.draw do

  # custom devise_turbo setup
  # devise_scope :user do
  #   # Redirests signing out users back to sign-in
  #   get "users", to: "devise/sessions#new"
  #   # get "/topics/:topic_id/offers/new", to: "offers#new", as: :new_offer
  #   get "topics/:topic_id/categories/:category_id/offers", to: "offers#index", as: :offer_index

  # end
  devise_for :users, :path_prefix =>'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'pages#home'
  # USER DASHBOARD
  get "/profil", to: "dashboards#show"
  get "/admin", to: "dashboards#admin", as: :admin
  get "/about", to: "pages#about"
  get "/search", to: "searches#index"
  get "/choosetopic", to: "offers#choose_topic", as: :choose_topic


  # NESTED ROUTES FOR TOPIC->CATEGORY->OFFERS->OFFER
  resources :topics, only: [:show, :index] do
    resources :offers, only: :new
    resources :categories, only: [:show, :index]
  end


  # UNNESTED OFFERS ROUTES
  resources :offers, only: [:show, :create, :edit, :update, :destroy, :index]
  # UNNESTED CATEGORIES ROUTES
  resources :categories, only: [:new, :create]

  # For changing the offer status
  resources :offers do
    member do
      get :toggle_status
    end
  end

  # Article routes

  resources :articles, except: :destroy
  delete "/articles/:id", to: "articles#destroy", as: :delete_article

  #sidekiq

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :accounts
end
