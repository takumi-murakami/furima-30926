FactoryBot.define do
  factory :item_order do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'test1234'}
    password_confirmation {'test1234'}
    last_name             {'漢字'}
    first_name            {'ひらがな'}
    last_name_kana        {'カタカナ'}
    first_name_kana       {'カタカナ'}
  end
end