FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials(number: 2) }
    info             { 'あああ' }
    category_id      { 2 }
    status_id        { 2 }
    delivery_fee_id  { 2 }
    prefectures_id   { 2 }
    shipping_days_id { 2 }
    price            { 1000 }
    association :user

    trait :image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpg')) }
    end
  end
end
