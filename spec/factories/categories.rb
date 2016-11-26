FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "#{Faker::Name.name}#{n}" }
    sequence(:sort_order) { |n| n }
  end
end
