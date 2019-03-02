class AddMenuIdToHeader < ActiveRecord::Migration[5.2]
  def change
    add_reference :headers, :menu, foreign_key: true
    add_reference :items, :menu, foreign_key: true
  end
end
