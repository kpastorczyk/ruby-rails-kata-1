Rails.application.routes.draw do
  get 'home/index'
  post '/', to: 'home#search'
  root 'home#index'
end
