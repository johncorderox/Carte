Rails.application.routes.draw do

  root  'home#index'

  resources :menus

  devise_for :users
end
