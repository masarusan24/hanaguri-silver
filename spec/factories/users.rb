FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:email) { |n| "hoge_#{n}@example.com" }
    sequence(:password) { |n| "password_#{n}" }
    admin false
  end

  trait :as_admin do
    admin true
  end
end
