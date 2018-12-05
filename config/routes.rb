Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/new'
  
  get  'welcome/index'
  root 'welcome#index'

  get "/:id/dashboard", to: 'users#dashboard', as: "dashboard"
  
  resources :users

  resources :groups do
    resources :bills
  end
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  post '/users/:id/befriend', to: 'friends#befriend', as: "befriend"
  post '/users/:id/unfriend', to: 'friends#unfriend', as: "unfriend"

  get "/mygroups" => "groups#my_groups", as: "my_groups"

  post '/groups/:id/join', to: 'memberships#join', as: "join"
  post '/groups/:id/leave', to: 'memberships#leave', as: "leave"
end
