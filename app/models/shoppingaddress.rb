class Shoppingaddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase
  # belongs_to_active_hash :prefecture_code
end