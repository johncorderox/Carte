class Item < ApplicationRecord
  belongs_to :header
  belongs_to :menu

  validates :name,:size1,:size2,:size3, presence: true, length: { minimum: 1}

end
