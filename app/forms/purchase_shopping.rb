class PurchaseShopping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_code, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }
    validates :token
  end

  validates :prefecture_code, numericality: { other_than: 0, message: 'is not selected' }

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Shoppingaddress.create(post_code: post_code, prefecture_code: prefecture_code, city: city, address: address, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end