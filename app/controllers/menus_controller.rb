class MenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @menus = Menu.find_my_menus(params[:id])
  end

  def new

  end
  def create
    @new_menu = Menu.new(new_menu)
    if @new_menu.save
      redirect_to menus_path
    else
      puts @new_menu.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def new_menu
    params.require(:menu).permit(:name, :user_id)
  end


end
