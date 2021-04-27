class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :store_name
    validates :store_address
    validates :name
    validates :info
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 9_999_999 }
    validates :category_id, numericality: { other_than: 1 }
  end
end
