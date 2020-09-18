FactoryBot.define do
  factory :user do
    nickname              { 'testaro' }
    email                 { 'aaa@gmail.com' }
    password              { '00000000' }
    password_confirmation { password }
    first_name            { '山田' }
    family_name             { '大樹' }
    first_name_kana       { 'ヤマダ' }
    family_name_kana        { 'タロウ' }
    birthday            { '1999-12-10' }
  end
end