FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    birth_date{"1930-01-01"}
    cust_first_name{"太郎"}
    cust_last_name{"田中"}
    first_name{"cc"}
    last_name{"dd"}
  end
end