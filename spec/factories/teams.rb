FactoryBot.define do
  factory :team do
    team_name 'Hanaguri Silver'
    team_short_name 'silver'
  end

  trait :invalid_team do
    team_short_name nil
  end

  trait :with_members do
    after(:create) { |team| create_list(:member, 9, team: team) }
  end

  trait :with_games do
    after(:create) { |team| create_list(:game, 10, team: team) }
  end
end