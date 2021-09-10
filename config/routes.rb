Rails.application.routes.draw do
  root to: 'pages#home'
  get '/home' => 'pages#home'
  devise_for :users 
  resources :articles

  authenticate :user, -> (u) { u.admin? } do
    resources :users, except: :create
    post 'create_user' => 'users#create', as: :create_user
  end
end
