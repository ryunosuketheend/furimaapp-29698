FactoryBot.define do
  factory :user do
    nickname              { '筋肉太郎' }
    first_name            { '筋肉' }
    last_name             { '太郎' }
    first_name_katakana   { 'キンニク' }
    last_name_katakana    { 'タロウ' }
    birthday              { '2020-01-01' }
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
