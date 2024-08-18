FactoryBot.define do
  factory :item do
    image               {}
    title               {'子犬'}
    text                {'我が家の柴犬'}
    category_id         { 2 }
    condition_id        { 3 }
    delivery_charge_id  { 2 }
    area_id             { 11 }
    days_to_ship_id     { 4 }
    price               { 9999 }
  end
end
