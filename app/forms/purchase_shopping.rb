class PurchaseShopping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_code, :city, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :city
    validates :building_name
    validates :phone_number, length: { maximum: 11 }
  end

  validates :prefecture_code, numericality: { message: 'select' }

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(post_code: post_code, prefecture_code: prefecture_code, city: city, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end