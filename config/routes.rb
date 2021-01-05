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

  # 使用者的提案列表
  resources :users do
    resources :projects, only: [:index], action: :user_projects
  end
  
  # 專案
  resources :projects, path_names: {new: 'proposal'} do
    
    # 留言
    resources :comments, shallow: true, only: [:new, :create, :destroy]
    
    # 聯絡短信
    resources :textings, only: [:index, :show, :create]

    # 回饋
    resources :givebacks, except: [:new]
  end

end



