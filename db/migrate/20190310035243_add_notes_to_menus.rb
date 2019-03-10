class AddNotesToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :notes, :text
  end
end
