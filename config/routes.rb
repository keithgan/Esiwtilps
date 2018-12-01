Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/new'
  
  get  'welcome/index'
  root 'welcome#index'
  
  resources :users
  resources :groups
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
