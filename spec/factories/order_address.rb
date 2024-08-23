FactoryBot.define do
  factory :order_address do
    postal_code     { '000-1234' }
    area_id         { 14 }
    city            { '種子島' }
    house_number    { '銃1-2-3' }
    building_name   { 'マンション1-3' }
    phone_number    { '09011112222' }
    token           { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
