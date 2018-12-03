Rails.application.routes.draw do

  get 'items/index'
  get 'menus/index'
  devise_for :users
end
