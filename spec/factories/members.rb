FactoryBot.define do
  factory :member do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:full_name) { |n| "full name_#{n}" }
    association :team
  end
end
