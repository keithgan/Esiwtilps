Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/new'
  
  get  'welcome/index'
  root 'welcome#index'

  get "/:id/dashboard", to: 'users#dashboard', as: "dashboard"
  
  resources :users
  resources :groups
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  post '/user/:id/befriend', to: 'friends#befriend', as: "befriend"
  post '/user/:id/unfriend', to: 'friends#unfriend', as: "unfriend"

  get "/mygroups" => "groups#my_groups", as: "my_groups"

end
