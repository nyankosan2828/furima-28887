class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :handling_time
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :name, :description, :category, :product_status, :postage_payer, :handling_time, :prefecture_code, :image
    validates :price, numericality:  { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end

  with_options numericality: { other_than: 0, message: 'is not selected' } do
    validates :category_id, :product_status_id, :postage_payer_id, :handling_time_id, :prefecture_code_id
  end
end