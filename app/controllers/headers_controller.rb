class HeadersController < ApplicationController
  def create
    @header = HeaderService.new(params).call
    if @header.save
      create_new_header_log(@header)
      redirect_to edit_menu_path(params[:menu_id])
      flash[:notice] = "Header #{@header.name} Created!"
    else
      create_destroy_header_error_log(@header)
      redirect_back(fallback_location: menus_path)
      flash[:alert] = @header.errors.full_messages
    end
  end

  def destroy
    @header = Header.destroy(params[:id])
    redirect_back(fallback_location: menus_path)
    flash[:notice] = "Header Destroyed!"
    create_destroy_header_log(@header)
  end

  def flush_headers
    @menu_id = Menu.find(params[:id])
    Header.where(menu_id: @menu_id).delete_all
  end

end
