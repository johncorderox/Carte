class Log < ApplicationRecord
  belongs_to :menu

  def self.find_menu_logs(id)
    where(menu_id: id).order(id: :desc)
  end
end
