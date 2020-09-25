class PurchaseShopping
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_code, :city, :address, :phone_number, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :city
    validates :address
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end

  validates :prefecture_code, numericality: { other_than: 0 }

  def save
    purchase = purchase.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(post_code: post_code, prefecture_code: prefecture_code, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase_id)
  end
end