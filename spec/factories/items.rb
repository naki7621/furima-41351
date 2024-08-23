FactoryBot.define do
  factory :item do
    title               { '子犬' }
    text                { '我が家の柴犬' }
    category_id         { 2 }
    condition_id        { 3 }
    delivery_charge_id  { 2 }
    area_id             { 11 }
    days_to_ship_id     { 4 }
    price               { 9999 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/サンプル画像１.jpg'), filename: 'サンプル画像１.jpg')
    end
  end
end
