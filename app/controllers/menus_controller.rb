class MenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @menus = Menu.find_my_menus(params[:id])
  end

  def new
    @menu = Menu.new(params[:menu])
    if @menu.save

    else

    end
  end
  def create
  end
end
