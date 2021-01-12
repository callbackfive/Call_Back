Rails.application.routes.draw do
  root to: "home#index"
  
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
    resources :comments, shallow: true, only: [:new, :create, :destroy]
  end 

  resource :project, only: [] do
    resources :givebacks, except: [:new] 
  end

  resources :users do
    resources :projects, only: [:index], action: :user_projects_index
    resources :orders, only: [:index, :new, :create, :show]
  end

  resources :categories, only: [:new, :show] do
  end
  
  resources :payments do
    collection do
      get :mpg
      get :canceled
      post :notify
      post :paid
      post :not_paid_yet
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



