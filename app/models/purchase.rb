class Purchase < ApplicationRecord
  has_one :Address
  belongs_to :item
  belongs_to :user
end
