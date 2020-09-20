class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    vilidates :image
    validates :name
    validates :description
    validates :price, numericality:
    { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range' }
  end

  with_options numericality: { message: 'select' } do
    validates :category_id
    validates :product_status_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :handling_time_id
  end 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :handling_time
end
