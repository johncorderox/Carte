class Log < ApplicationRecord
  belongs_to :menu


  def self.find_menu_logs(id)
    where(menu_id: id).order(id: :desc)
  end

  def self.find_last_log(id)
    where(user_id: id).limit(1).order(id: "desc")
  end

end
