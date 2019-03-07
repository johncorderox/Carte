class RemoveVeganFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :vegan, :boolean
  end
end
