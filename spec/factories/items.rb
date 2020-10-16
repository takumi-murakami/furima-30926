FactoryBot.define do
  factory :item do
    title                   {Faker::Name.initials}
    text                    {Faker::Lorem.sentence}
    category_id             {'2'}
    sales_status_id         {'3'}
    shipping_fee_status_id  {'2'}
    prefecture_id           {'3'}
    scheduled_delivery_id   {'2'}
    price                   {'1000'}  
    image                   {Faker::Lorem.sentence}
    association :user
  end
end