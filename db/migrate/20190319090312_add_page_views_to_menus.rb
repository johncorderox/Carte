class AddPageViewsToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :page_views, :integer, :default => 0
  end
end
