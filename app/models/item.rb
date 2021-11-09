class Item < ApplicationRecord
  belongs_to :user
  has_one :order

  validates :user, presence: true
  validates :item, presence: true
  validates :info, presence: true  
  validates :category_id, presence: true
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :rank_id, presence: true  
  validates :postage_id, presence: true
  validates :area_id, presence: true
  validates :scheduled_id, presence: true
  validates :price, presence: true  
  validates :image, presence: true
  end

#   ## items table
# userテーブルとorderテーブルのbelong_to,has_one README見てから先に書きました
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

# ### Association
# - belongs_to :user
# - has_one :order
