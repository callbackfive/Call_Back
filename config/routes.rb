Rails.application.routes.draw do
  root to: "home#index"

  namespace :admin do
    root to: "users#index"
    resources :categories
    resources :projects
    resources :givebacks
    resources :users
    resources :orders
    resources :comments
    resources :notifications
    resources :dialogboxes
    resources :messages
  end
  
  # --------------user-------------
  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks",
  }

  resources :users do
    resources :projects, only: [:index], action: :user_projects_index
    resources :orders, only: [:index, :new, :create, :show]
    collection do
      get '/profile' ,to: 'profiles#show'
    end
  end

  # --------------project-------------
  resources :projects, path_names: {new: 'proposal'} do
    member do
      get 'myorderlist', action: :project_orders_index 
      get 'rewards', action: :project_givebacks
      post 'favorite'
    end

    collection do
      get :my_favorite
    end

    resources :comments, shallow: true, only: [:new, :create, :destroy]
  end 

  resource :project, only: [] do
    resources :givebacks, except: [:new] 
  end
  
  # --------------payment-------------
  resources :payments do
    collection do
      get :mpg
      post :notify
      post :paid
    end
  end

  # 對話框
  resources :dialogboxes, only: [:index, :show, :create], shallow: true
  
  # 訊息
  resources :messages, only: :index

  # 專案頁面創訊息
  post '/project/create_message', action: 'create_message', controller: 'projects'

  # 對話框創訊息
  post '/dialogbox/create_message', action: 'create_message', controller: 'dialogboxes'

  resources :categories, shallow: true
  
  resources :notifications, only: [:index]

  get '/apis/projects', action: 'projects',controller: 'apis'
  get '/apis/categories', action: 'categories',controller: 'apis'
  get '/apis/succeeded', action: 'succeeded',controller: 'apis' 
end



