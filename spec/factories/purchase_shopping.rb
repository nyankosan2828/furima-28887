FactoryBot.define do
  factory :purchase_shopping do
    post_code { '921-12345'}
    prefecture_code { 17 }
    city { '石川県' }
    address { '金沢市1-2-3' }
    phone_number { '08012345678' }
    building_name { 'プレミア金沢' }
  end
end