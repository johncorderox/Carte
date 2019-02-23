class Menu < ApplicationRecord
  belongs_to :food
  belongs_to :drink

  def self.find_my_menus(my_id)
    find_by(user_id: my_id)
  end
end
