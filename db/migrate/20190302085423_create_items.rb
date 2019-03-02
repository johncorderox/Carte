class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :size1
      t.string :size2
      t.string :size3
      t.boolean :vegan

      t.timestamps
    end
  end
end
