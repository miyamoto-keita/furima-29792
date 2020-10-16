FactoryBot.define do
  factory :purchase_address do
    postcode { '123-4567'}
    area_id { 2 }
    city { 2 }
    block { '1-1' }
    phone_number {'00000000000'}
    token {'aaaaaaaaaaaa'}

  end
end
