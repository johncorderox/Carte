class ItemsController < ApplicationController

  def create
    @create_item = Item.new(new_item)
    if not @create_item.save
      flash[:alert] = @create_item.errors.full_messages
    end
    redirect_back(fallback_location: menus_path)
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_back(fallback_location: menus_path)
  end

  private

    def new_item
      params.require(:item).permit(:name, :size1, :size2, :size3, :menu_id, :header_id)
    end
end
