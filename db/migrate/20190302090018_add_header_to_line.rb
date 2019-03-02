class AddHeaderToLine < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :header, foreign_key: true
  end
end
