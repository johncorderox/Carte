class HeadersController < ApplicationController
  def create
    @header = Header.new(new_header)
    if @header.save
      redirect_to edit_menu_path(params[:menu_id])
    else
      redirect_back(fallback_location: menus_path)
      flash[:alert] = @header.errors.full_messages
    end
  end

  def destroy
    Header.destroy(params[:id])
    redirect_back(fallback_location: menus_path)
    flash[:notice] = "Header Destroyed!"
  end

  private
    def new_header
      params.require(:header).permit(:name, :menu_id)
    end
end
