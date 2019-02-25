class AddSettingsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company, :string
    add_column :users, :bio, :text
    add_column :users, :location, :string
    add_column :users, :industry, :string
  end
end
