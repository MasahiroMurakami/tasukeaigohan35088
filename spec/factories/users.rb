FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '山田' }
    family_name_kana      { 'ヤマダ' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birth_day             { '2000-01-01' }
    address               { '福岡県福岡市博多区吉塚0-0-0'}
    phone_number          { '09012345678'}
  end
end
