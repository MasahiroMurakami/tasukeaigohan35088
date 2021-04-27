class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string   :store_name,               null: false
      t.text     :store_address,            null: false
      t.string   :store_phone_number,       null: false
      t.string   :name,                     null: false
      t.text     :info,                     null: false
      t.integer  :price,                    null: false
      t.integer  :category_id,              null: false
      t.text     :allergies,                null: false
      t.text     :remarks,                  null: false
      t.integer  :user_id,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
