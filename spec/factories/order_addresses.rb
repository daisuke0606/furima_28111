FactoryBot.define do
  factory :order_address do
    post_code       { '123-4567' }
    prefectures_id  { 2 }
    city            { '横浜市旭区' }
    block           { '麻1-1' }
    building        { '丘ビル102' }
    phone           { '09012345678' }
    user_id         { 2 }
    item_id         { 4 }
    token           { 'aaa' }
    #association :order
  end
end
