FactoryBot.define do
  factory :evaluated do
    name { Faker::Name.name }
    cpf { "634.780.020-95" }
    email { Faker::Internet.email }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
