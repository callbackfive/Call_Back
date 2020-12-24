Rails.application.routes.draw do
  root to: "projects#index"

  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations" 
  }

  resources :projects, except: [:destroy]
   
end
