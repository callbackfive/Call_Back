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

  resources :projects, except: [:destroy]
   
end
