class BuyerHistory < ApplicationRecord
  belongs_to :item
  has_one :order
  belongs_to :user
end
