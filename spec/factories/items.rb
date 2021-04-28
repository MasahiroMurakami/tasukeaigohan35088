FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
    store_name               { 'レストランtest' }
    store_address            { '福岡県福岡市博多区吉塚0-0-0' }
    store_phone_number       { '09012345678' }
    name                     { 'test' }
    info                     { '美味しい惣菜です' }
    category_id              { 2 }
    allergies                { '小麦' }
    remarks                  { 'なし' }
    price                    { 10_000 }
    association :user
  end
end
