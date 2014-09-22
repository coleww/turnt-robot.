Rails.application.routes.draw do
  root 'session#new'
  post '/session', to: 'session#create'
end
