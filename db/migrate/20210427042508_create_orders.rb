class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string    :name,           null: false
      t.text      :address,       null: false
      t.string    :phone_number,        null: false
      t.integer   :buyer_history_id,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
