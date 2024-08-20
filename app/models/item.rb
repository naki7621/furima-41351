class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_charge
  belongs_to :area
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validate :price_half_width_digit

  private 

  def price_half_width_digit
    unless price.to_s.match?(/\A[0-9]+\z/)
      errors.add(:price, 'は半角数字でなければなりません')
    end
  end
end