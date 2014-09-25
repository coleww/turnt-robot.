Rails.application.routes.draw do
  root 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'

  get '/home', to: 'home#index'
  post '/new', to: 'statuses#create'
  get '/new', to: 'statuses#new'
  get '/all', to: 'statuses#index'
end
