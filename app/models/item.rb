class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :rank
  belongs_to :postage
  belongs_to :area
  belongs_to :scheduled

  belongs_to :user
  # has_one :order
  has_one_attached :image
  # validates :user, presence: true
  validates :item, presence: true
  validates :info, presence: true  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :rank_id, numericality: { other_than: 1, message: "can't be blank" }   
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :scheduled_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, numericality: { message: "can't be blank" } 
  validates_inclusion_of :price, in:300..9999999 
  # , message: "Price is not included in the list"
  validates :image, presence: true
  # validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
    validates :price

  end
  
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
