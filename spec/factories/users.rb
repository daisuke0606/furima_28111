FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '佐藤' }
    last_name             { '大佑' }
    first_name_kana       { 'サトウ' }
    last_name_kana        { 'ダイスケ' }
    birth                 { '1998.4.6' }
  end
end
