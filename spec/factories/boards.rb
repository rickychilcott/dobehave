FactoryBot.define do
  factory :board do
    email { Faker::Internet.email }
  end
end
