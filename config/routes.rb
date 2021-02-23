Rails.application.routes.draw do
  resources :histories
  resources :comments
delete '/comment', to: "comments#destroy"
get'/comments', to: "comments#show"

  resources :e_docs
  delete'/e_docs',to:"e_docs#destroy"
  get'/e_doc', to: "e_docs#show"

  resources :download
  get '/download',to: "download#show"
 
  

  resources :admins
  get '/users', to: "users#index"
  get '/sign_up_admin', to: "admins#new"
  get '/log_in', to: "session#new"
  post '/log_in', to: "session#create"
  delete'log_out',to: "session#destroy"
 

  resources :categories
  get '/categories', to: "categories#index"


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
  get '/history', to:"histories#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end