class Pay
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :code, :area_id, :city, :number, :building, :tel, :token

  with_options presence: true do
    validates :user_id
    validates :code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: true
    validates :number, presence: true
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token, presence: true
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create!(order_id: order.id, code: code, area_id: area_id, city: city, number: number, building: building, tel: tel)
  end
end