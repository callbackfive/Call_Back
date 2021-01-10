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
    # 回饋
    resources :givebacks, except: [:new]
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



