FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.unique.free_email }
    password              { '000aaa' }
    password_confirmation { password }
    last_name             { 'あア亜' }
    first_name            { 'あア亜' }
    last_name_kana        { 'アイウ' }
    first_name_kana       { 'アイウ' }
    birth_date            { '1930-01-01' }
  end
end
# Faker::