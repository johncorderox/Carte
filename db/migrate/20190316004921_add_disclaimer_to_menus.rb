class AddDisclaimerToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :disclaimer, :text
  end
end
