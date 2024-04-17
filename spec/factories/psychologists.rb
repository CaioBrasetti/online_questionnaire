FactoryBot.define do
  factory :psychologist do
    name { Faker::Name.name }
    association :user, factory: :user
  end
end
