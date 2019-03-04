class HeadersController < ApplicationController
  def create
    @header = Header.new(new_header)
    if @header.save
      redirect_to edit_menu_path(params[:menu_id])
    else
      # redirect_to topic_path(params[:topic_id])finish
    end
  end

  def destroy
    Header.destroy(params[:id])
    redirect_back(fallback_location: menus_path)
  end

  private
    def new_header
      params.require(:header).permit(:name, :menu_id)
    end
end
