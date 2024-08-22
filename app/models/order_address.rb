class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Include 10 or 11 digits only" }

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end