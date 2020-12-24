Rails.application.routes.draw do
  root to: "projects#index"

  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :projects, except: [:destroy]
   
end
