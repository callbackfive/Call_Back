Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations" 
  }
   
end
