FactoryBot.define do
  factory :item do
    name                {'商品'}
    detail              {'商品の説明'}
    category            {'レディース'}
    quality             {'新品、未使用'}
    delivery_cost       {'送料込み (出品者負担)'}
    delivery_day        {'1〜2日で発送'}
    price               {'30000'}
    user_id             {'1'}
    region_id           {'1'}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    # text {Faker::Lorem.sentence}
    # image {Faker::Lorem.sentence}
    association :user 
  end
end
