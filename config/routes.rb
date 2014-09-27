Rails.application.routes.draw do
  root 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'

  get '/home', to: 'status#show'
  post '/status', to: 'status#create'
  get '/status', to: 'status#new'
  get '/all', to: 'status#index'
end
