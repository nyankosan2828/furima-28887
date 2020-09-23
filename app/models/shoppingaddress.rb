class Shoppingaddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :purchase
  belongs_to_active_hash :prefecture_code
end