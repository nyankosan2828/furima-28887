FactoryBot.define do
  factory :item do
    name                { 'test商品' }
    description         { 'test' }
    price               { '500' }
    category_id         { '10' }
    product_status_id   { '1' }
    postage_payer_id    { '3' }
    prefecture_code_id  { '13' }
    handling_time_id    { '1' }
    association :user
  end
end
