class CreateShoppingaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppingaddresses do |t|
      t.string :post_code,               null: false
      t.integer :prefecture_code_id,     null: false
      t.string :city,                    null: false
      t.string :building_name           
      t.string :phone_number
      t.references :user,                null: false, foreign_key: true
      t.references :purchase,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
