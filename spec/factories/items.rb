FactoryBot.define do
  factory :item do
    item        { 'あア亜' }
    info        { 'あア亜' }
    category_id { 2 }
    rank_id     { 2 }
    postage_id  { 2 }
    area_id     { 2 }
    scheduled_id { 2 }
    price       { 1000 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
