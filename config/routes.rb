Rails.application.routes.draw do

  # custom devise_turbo setup
  # devise_scope :user do
  #   # Redirests signing out users back to sign-in
  #   get "users", to: "devise/sessions#new"
  #   # get "/topics/:topic_id/offers/new", to: "offers#new", as: :new_offer
  #   get "topics/:topic_id/categories/:category_id/offers", to: "offers#index", as: :offer_index

  # end
  devise_for :users
  scope "/admin" do
    resources :users
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'pages#home'
  # USER DASHBOARD
  get "/profil", to: "dashboards#show"
  get "/admin", to: "dashboards#admin", as: :admin
  get "/blog_board", to: "dashboards#blog_board"
  get "/user_board", to: "dashboards#user_board"
  get "/offer_board", to: "dashboards#offer_board"
  get "/about", to: "pages#about"
  get "/search", to: "searches#index"


  # NESTED ROUTES FOR TOPIC->CATEGORY->OFFERS->OFFER
  resources :topics, only: [:show, :index] do
    resources :categories, only: [:show, :index]
  end


  # UNNESTED OFFERS ROUTES
  resources :offers, only: [:new, :create, :show, :create, :edit, :update, :destroy, :index]
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
  delete '/articles/:id', to: 'articles#destroy', as: :delete_article

  #sidekiq

  require 'sidekiq/web'
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
