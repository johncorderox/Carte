class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:edit, :show, :live]
  before_action :set_menu_vars, only: [:show, :live]

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
    @new_menu = Menu.new(new_menu)
    if @new_menu.save
      create_new_menu_log(@new_menu)
      redirect_to menus_path
      flash[:notice] = "Menu #{@new_menu.name} Created!"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  @destroy_menu = Menu.destroy(params[:id])
    redirect_to menus_path
    flash[:notice] = "Menu Destroyed!"
  end

  def update
    @menu_id = Menu.find(params[:id])
    if @menu_id
      @menu_id.update(update_status_of_menu)
      redirect_back(fallback_location: root_path)
      flash[:notice] = "Menu has been Updated!"
    end
  end

  def notes
    @menu_id = Menu.find(params[:id])
    if @menu_id
      @menu_id.update(update_menu_notes)
      redirect_back(fallback_location: root_path)
      flash[:notice] = "Notes successfully updated!"
    end
  end

  def download

  @menu = Menu.find(params[:id])

  if @menu.notes.blank?
    redirect_back(fallback_location: root_path)
    flash[:alert] = " There are no Notes to download...!"
  else
    create_note
    @name_of_menu = @menu.name.parameterize()

    full_new_notes_file = File.new("public/MENU_#{@name_of_menu}.txt", "w")
    full_new_notes_file.puts(@menu.notes)
    full_new_notes_file.close

    send_file "#{Rails.root}/public/MENU_#{@name_of_menu}.txt"
    create_downloaded_file_log(@menu)
    end
  end

  def disclaimer
    @menu_id = Menu.find(params[:id])
    if @menu_id
      @menu_id.update(update_menu_disclaimer)
      redirect_back(fallback_location: root_path)
      flash[:notice] = "Disclaimer successfully updated!"
    end
  end

  def show
    add_profile_views_count(@menu.id)
  end

  def new
  end

  def live
  end


    private

      def new_menu
        params.require(:menu).permit(:name, :user_id)
      end

      def set_menu
        @menu = Menu.find(params[:id])
      end

      def set_menu_vars
        @show_header = Header.where(menu_id: params[:id])
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


end
