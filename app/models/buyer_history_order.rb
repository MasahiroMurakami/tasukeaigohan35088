class BuyerHistoryOrder
  include ActiveModel::Model
  attr_accessor :token, :name, :addresses, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :name
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10,11}\z/ },numericality: { only_integer: true}
    validates :user_id
    validates :item_id
  end

  def save
    buyer_history = BuyerHistory.create(user_id: user_id, item_id: item_id)
    Order.create( name: name, addresses: addresses,phone_number: phone_number, buyer_history_id: buyer_history.id)
  end
end
