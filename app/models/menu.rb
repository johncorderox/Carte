class Menu < ApplicationRecord

  belongs_to :user

  has_many :headers
  has_many :items

  validates :name, presence: true, length: { minimum: 1}


  before_save :initialize_menu_status

  def self.find_my_menus(my_id)
    where(user_id: my_id).order(created_at: :desc)
  end

  def self.find_closed_menus
    where(status: "closed")
  end

  # def self.change_status_of_menu(num)
  #   case num
  #   when 1
  #     .status("New")
  #   end
  #  when 2
  #     .status("Active")
  #   end
  #  when 3
  #     .status("In Progress")
  #   end
  #   when 4
  #     .status("Archived")
  #   end
  #   when 5
  #     .status("Closed")
  #   end
  #   else
  #     puts "Error updating menu status"
  # end


  private

    def initialize_menu_status
      self.status = "New" if self.status.nil?
    end

end
