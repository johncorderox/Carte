class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :description
      t.string :status
      t.integer :code
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
