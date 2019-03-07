class Item < ApplicationRecord
  belongs_to :header
  belongs_to :menu
end
