FactoryBot.define do
  factory :team do
    team_name 'Hanaguri Silver'
    team_short_name 'Silver'
  end

  trait :with_members do
    after(:create) { |team| create_list(:member, 9, team: team) }
  end

  # trait :with_games do
  #   after(:create) { |game| create_list(:game, 10, game: game) }
  # end
end