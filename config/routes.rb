Rails.application.routes.draw do
  root to: "projects#index"

  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks",
  }
  
  resource :users, controller: 'profiles', only: [] do
    get '/profile', action: 'show'
  end

  # projects
  resources :projects, shallow: true, except: :new do
    resources :comments
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
