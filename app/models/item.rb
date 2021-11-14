class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postage

  belongs_to :category
  belongs_to :rank
  belongs_to :postage
  belongs_to :area
  belongs_to :scheduled
  belongs_to :user
  
  has_one_attached :image

  validates :item, presence: true
  validates :info, presence: true  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :rank_id, numericality: { other_than: 1, message: "can't be blank" }   
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :scheduled_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, numericality: { message: "半角数字を使用してください" } 
  validates_inclusion_of :price, in:300..9999999, message: "is not included in the list"  
  validates :image, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price

  end
  
  end