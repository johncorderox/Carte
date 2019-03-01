class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:edit, :show]

  def index
    @menus = Menu.find_my_menus(current_user.id)
  end

  def close_menu
    redirect_back if Menu.find(params[:id]).status("Closed")
  end

  def create
    @new_menu = Menu.new(new_menu)
    if @new_menu.save
      redirect_to menus_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Menu.destroy(params[:id])
    redirect_to menus_path
  end

  def new
  end


  private

  def new_menu
    params.require(:menu).permit(:name, :user_id)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end


end
