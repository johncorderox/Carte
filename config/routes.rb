Rails.application.routes.draw do

  root  'home#index'

  resources :menus

  devise_for :users

  patch '/menus/closemenu'     => 'menus#close_menu'

  post '/menus/add_new_header' => 'menus#add_new_header'
end
