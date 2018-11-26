FactoryBot.define do
  factory :game do
    year Time.zone.now.year
    date Time.zone.today
    team_top 'シルバー'
    team_bottom 'ゴーゴー'
    association :team
    # TODO: after(:create)コールバックを加えてもdestroyアクションのテスト成功するように修正する
    # has_one :score, dependent: :destroy としてるので成功するハズだが、以下エラーが発生する
    # ActiveRecord::InvalidForeignKey:
    #    PG::ForeignKeyViolation: ERROR:  update or delete on table "games" violates foreign key constraint "fk_rails_41612d9bae"on table "scores"
    # after(:create) { |game| create(:score, game: game) }
    after(:build) { |game| build(:score, game: game) }
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

  trait :invalid_game do
    date        nil
    team_top    nil
    team_bottom nil
  end

  trait :with_score do
    after(:create) { |game| create(:score, game: game) }
  end
end
