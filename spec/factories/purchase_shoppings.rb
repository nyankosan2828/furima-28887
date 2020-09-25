FactoryBot.define do
  factory :purchase_shopping do
    post_code                 { '921-1234' }
    prefecture_code           { '17' }
    city                      { '金沢市' }
    address                   { '1-2-3' }
    phone_number              { '08012345678' }
    building_name             { 'プレミア金沢' }
    token                     { 'token' }
  end
end
