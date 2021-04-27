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

  has_one :buyer_history
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  def self.search(search)
    if search != ""
      Item.where('store_name LIKE(?) or store_address LIKE(?) or name LIKE(?) or info LIKE(?) or price LIKE(?)', "%#{search}%","%#{search}%","%#{search}%", "%#{search}%", "%#{search}%")
    else
      Item.all
    end
  end
end
