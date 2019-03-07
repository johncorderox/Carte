Rails.application.routes.draw do

  root  'home#index'

  resources :menus
  resources :headers, only: [:create, :destroy]
  resources :items,   only: [:create, :destroy]

  devise_for :users

  patch '/menus/closemenu'   => 'menus#close_menu'


end
