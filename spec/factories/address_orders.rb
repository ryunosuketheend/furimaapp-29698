FactoryBot.define do
  factory :address_order do
    token             {"one"}
    postal_code       {"000-0000"}
    region_id     {1}
    city              {"渋谷区"}
    house_number      {"1-1"}
    building_name     {"渋谷マンション"}
    phone_number      {"08012345678"}
    association :user
    association :item
  end
end