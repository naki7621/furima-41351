class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :house_number, :building_name, :phone_number

  validates :postal_code, presence: true
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end