FactoryBot.define do
  factory :pay do
    code { '123-4567' }
    area_id { 2 }
    city { 'あア亜' }
    number { '1-1' }
    building { 'あア亜ハイツ' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
