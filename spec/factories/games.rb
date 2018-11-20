FactoryBot.define do
  factory :game do
    year Time.zone.now.year
    date Time.zone.today
    team_top 'シルバー'
    team_bottom 'ゴーゴー'
    association :team
  end

  trait :bat_first do
    bat_first true
  end

  trait :bat_bottom do
    bat_first false
  end

  trait :without_date do
    date nil
  end

  trait :without_team_top do
    team_top nil
  end

  trait :without_team_bottom do
    team_bottom nil
  end

  trait :with_score do
    after(:create) { |game| create(:score, game: game) }
  end
end
