FactoryBot.define do
  factory :item do
    association :user
    name { Faker::Name.last_name }
    price { 5000 }
    description { '田中' }
    category_id { 2 }
    status_id { 2 }
    delivery_charge_id { 2 }
    area_id { 2 }
    delivery_date_id { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
