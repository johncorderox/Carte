class Header < ApplicationRecord
  has_many :items

  belongs_to :menu

  validates :name, presence: true, length: { minimum: 1}

end
