class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:edit, :show, :live, :download]
  before_action :set_menu_vars, only: [:show, :live]
  before_action :set_menu_id, only: [:update, :disclaimer, :notes, :status]

  def index
    @menus = Menu.find_my_menus(current_user.id)
    @last_log = Log.find_last_log(current_user.id)
  end

  def edit
    @headers = Header.where(menu_id: params[:id])
    @items = Item.joins(:header).where(menu_id: params[:id])
  end

  def close_menu
    redirect_back if Menu.find(params[:id]).status("Closed")
  end

  def create
    @menu = Menu.create(menu_params)
  end

  def destroy
    @destroy_menu = Menu.destroy(params[:id])
    redirect_to menus_path
    flash[:notice] = "Menu Destroyed!"
  end

  def update
    @menu_id.update(update_menu_name)
    redirect_back(fallback_location: root_path)
    flash[:notice] = "Menu Name has been Updated!"
  end

  def status
    @menu_id.update(update_status_of_menu)
    redirect_back(fallback_location: root_path)
    flash[:notice] = "Menu has been Updated!"
  end

  def notes
    @menu_id.update(update_menu_notes)
    redirect_back(fallback_location: root_path)
    flash[:notice] = "Notes successfully updated!"
  end

  def download

  if @menu.notes.blank?
    redirect_back(fallback_location: root_path)
    flash[:alert] = " There are no Notes to download...!"
  else
    @name_of_menu = @menu.name.parameterize()

    full_new_notes_file = File.new("public/MENU_#{@name_of_menu}.txt", "w")
    full_new_notes_file.puts(@menu.notes)
    full_new_notes_file.close

    send_file "#{Rails.root}/public/MENU_#{@name_of_menu}.txt"
    create_downloaded_file_log(@menu)
    end
  end

  def disclaimer
    @menu_id.update(update_menu_disclaimer)
    redirect_back(fallback_location: root_path)
    flash[:notice] = "Disclaimer successfully updated!"
  end

  def new
     @menu = Menu.new
  end

  def show
  end

  def live
  end


    private

      def set_menu
        @menu = Menu.find(params[:id])
      end

      def set_menu_vars
        @show_header = Header.where(menu_id: params[:id])
      end

      def set_menu_id
        @menu_id = Menu.find(params[:id])
      end

      def update_status_of_menu
        params.require(:status).permit(:status)
      end

      def update_menu_notes
        params.require(:menu).permit(:notes)
      end

      def update_menu_disclaimer
        params.require(:menu).permit(:disclaimer)
      end

      def update_menu_name
        params.require(:menu).permit(:name)
      end

      def menu_params
        params.require(:menu).permit(:name, :user_id)
      end


end
