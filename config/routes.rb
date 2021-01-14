Rails.application.routes.draw do
  namespace :admin do
    resources :categories
  end
  namespace :admin do
    resources :projects
  end
  root to: "home#index"

<<<<<<< HEAD
  get '/apis/projects', action: 'projects',controller: 'apis'
  get '/apis/categories', action: 'categories',controller: 'apis'

=======
  namespace :admin do
    root to: "home#index"
    resources :categories
    resources :projects
  end
  
>>>>>>> 2b097a8 (create admin/project page)
  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks",
  }

  resource :users, controller: 'profiles', only: [] do
    get '/profile', action: 'show'
  end

  # projects
  resources :projects, path_names: {new: 'proposal'} do
    member do
      get 'rewards', as: 'rewards', action: :project_givebacks
    end
    member do
      post :favorite
    end
    collection do
      get :my_favorite
    end
    resources :comments, shallow: true, only: [:new, :create, :destroy]
  end 

  resource :project, only: [] do
    resources :givebacks, except: [:new] 
  end

  resources :users do
    resources :projects, only: [:index], action: :user_projects_index
    resources :orders, only: [:index, :new, :create, :show] do
      member do
        get 'records', as: 'records', action: :paid_record
      end
    end
  end

  resources :categories, shallow: true
  
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

end



