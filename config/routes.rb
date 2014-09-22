Rails.application.routes.draw do
  root 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'
  get '/all', to: 'feeds#index'
end
