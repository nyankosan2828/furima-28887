FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_cofirmation { password }
    first_name { "山田" }
    family_name { "太郎" }
    first_name_kana { "ヤマダ" }
    family_name_kana { "タロウ" }
    birthfay { Faker::Date.birthfay }
  end
end