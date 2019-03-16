class Menu < ApplicationRecord

  belongs_to :user

  has_many :headers,  :dependent => :destroy
  has_many :items,    :dependent => :destroy
  has_many :logs,     :dependent => :destroy

  validates :name , presence: true, length: { minimum: 1}

  before_save :initialize_menu_status

  def self.find_my_menus(my_id)
    where(user_id: my_id).order(updated_at: :desc)
  end

  def self.find_closed_menus
    where(status: "closed")
  end

  private

    def initialize_menu_status
      self.status = "New" if self.status.nil?
    end

end
