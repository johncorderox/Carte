class ItemsController < ApplicationController

  def create
    @create_item = Item.new(new_item)
    if @create_item.save
    else
  end

  def destroy
  end

  private

    def new_item
      params.require(:item).permit(:name, :size1, :size2, :size3, :menu_id, :header_id)
    end
end
