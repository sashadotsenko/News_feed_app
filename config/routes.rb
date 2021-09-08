Rails.application.routes.draw do
  root to: 'pages#home'
  get '/home' => 'pages#home'
  devise_for :users do
    get "/users/sign_in" => "devise/sessions#new"
    get "/users/sign_up" => "devise/registrations#new"
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  resources :articles
end
