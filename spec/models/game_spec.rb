require 'rails_helper'

RSpec.describe Game, type: :model do
  # 日付とチーム名があれば有効であること
  it 'is valid with date and team names' do
    game = FactoryBot.build(:game)
    expect(game).to be_valid
  end

  # 日付なしだと無効であること
  it 'is invalid without date' do
    game = FactoryBot.build(:game, :without_date)
    expect(game).to be_invalid
  end

  # 先攻チームがないと無効であること
  it 'is invalid without team_top' do
    game = FactoryBot.build(:game, :without_team_top)
    expect(game).to be_invalid
  end

  # 後攻チームがないと無効であること
  it 'is invalid without team_bottom' do
    game = FactoryBot.build(:game, :without_team_bottom)
    expect(game).to be_invalid
  end

  # スコアと1対1になっていること
  it 'has one score' do
    game = FactoryBot.create(:game, :with_score)
    expect(game.score).to be_a(Score)
  end
end
