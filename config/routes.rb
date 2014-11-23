Rails.application.routes.draw do
  root to: 'visitors#hello'
  devise_for :users
  resources :users
end
