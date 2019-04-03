class Log < ApplicationRecord
  belongs_to :menu

  validates :description, presence: true
  validates :status, presence: true
  validates :code, presence: true



  def self.find_menu_logs(id)
    where(menu_id: id).order(id: :desc)
  end

  def self.find_last_log(id)
    where(user_id: id).limit(1).order(id: "desc")
  end

end
