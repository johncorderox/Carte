class Menu < ApplicationRecord
  # belongs_to :food
  # belongs_to :drink
  #

  validates :name, presence: true, length: { minimum: 1}


  before_save :initialize_menu_status

  def self.find_my_menus(my_id)
    find_by(user_id: my_id)
  end

  def self.find_closed_menus
    where(status: "closed")
  end

  private

    def initialize_menu_status
      self.status = "new" if self.status.nil?
    end

end
