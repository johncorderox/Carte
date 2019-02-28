Rails.application.routes.draw do

  root  'home#index'

  resources :menus

  devise_for :users

  patch '/menus/closemenu'     => 'menus#close_menu'
end
