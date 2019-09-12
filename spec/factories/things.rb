FactoryBot.define do
  factory :thing do
    summary { Faker::Company.bs }
    type { Thing::TYPES.sample }
  end
end
