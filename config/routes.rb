Rails.application.routes.draw do

  root  'home#index'

  resources :menus
  resources :headers, only: [:create, :destroy]
  resources :items,   only: [:create, :destroy]

  devise_for :users

  patch '/menus/closemenu'          => 'menus#close_menu'

  patch '/menus/:id/notes'          => 'menus#notes'

  patch '/menus/:id/disclaimer'     =>'menus#disclaimer'

  get   '/menus/download/:id'       => 'menus#download'

  get   '/menus/:id/logs'           => 'logs#show'

  get   '/menus/:id/live'           => 'menus#live'



end
