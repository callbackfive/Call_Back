Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  resource :users, controller: 'profiles', only: [] do
    get '/profile', action: 'show'
  end

  # projects
  resources :projects, only: :index
  resources :users do
    resources :projects, except: [:destroy], shallow: true
  end
   
end
