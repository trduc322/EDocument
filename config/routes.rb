Rails.application.routes.draw do
  resources :admins
  get '/sign_up_admin', to: "admins#new"
  get '/log_in', to: "session#new"
  post '/log_in', to: "session#create"
  delete'log_out',to: "session#destroy"

  resources :categories
  get 'session/new'
  get 'stactic_pages/home'
  get 'stactic_pages/help'

  root 'stactic_pages#home'
  get '/about', to:"stactic_pages#about" 
  resources :users
  get '/sign_up', to: "users#new"
 
  get '/log_in', to: "session#new"
  post '/log_in', to: "session#create"
  delete'log_out',to: "session#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end