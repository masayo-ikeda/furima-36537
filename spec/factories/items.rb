FactoryBot.define do
  factory :item do
        item        {'あア亜'}
        info        {'あア亜'}
        category_id {2}
        rank_id     {2}
        postage_id  {2}
        area_id     {2}
        scheduled_id{2}
        price       {1000}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
## items table

# | Column             | Type       | Options                        |
# |--------------------|------------|--------------------------------|
# | user               | references | null: false, foreign_key: true |
# | item               | string     | null: false                    |
# | info               | text       | null: false                    |
# | category_id        | integer    | null: false                    |
# | rank_id            | integer    | null: false                    |
# | postage_id         | integer    | null: false                    |
# | area_id            | integer    | null: false                    |
# | scheduled_id       | integer    | null: false                    |
# | price              | integer    | null: false                    |
