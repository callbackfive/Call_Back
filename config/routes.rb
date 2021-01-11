Rails.application.routes.draw do
  root to: "home#index"

  get '/apis/projects', action: 'projects',controller: 'apis'

  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks",
  }
  
  resource :users, controller: 'profiles', only: [] do
    get '/profile', action: 'show'
  end

  # projects
  resources :projects, except: [:new] do
    member do
      get 'rewards', as: 'rewards', action: :project_givebacks
    end
    resources :comments, shallow: true, only: [:new, :create, :destroy]
  end 

  resource :project, only: [] do
    collection do
      get 'proposal', as: 'new', action: :new
    end
    resources :givebacks, except: [:new] 
  end

  resources :users do
    resources :projects, only: [:index], action: :user_projects_index
  end

  

end
