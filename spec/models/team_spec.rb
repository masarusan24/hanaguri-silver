require 'rails_helper'

RSpec.describe Team, type: :model do
  # チーム名と略称があれば有効
  it 'is valid with team_name and team_short_name' do
    team = FactoryBot.build(:team)
    expect(team).to be_valid
  end

  # チーム名が255文字を超えると無効
  it 'is invalid with team_name over 255 charactors' do
    team = FactoryBot.build(:team, team_name: 'a' * 256)
    expect(team).to be_invalid
  end

  # チーム名が0文字だと無効
  it 'is invalid with team_name 0 charactor' do
    team = FactoryBot.build(:team, team_name: '')
    expect(team).to be_invalid
  end

  # チーム略称が16文字を超えると無効
  it 'is invalid with team_short_name over 16 charactors' do
    team = FactoryBot.build(:team, team_short_name: 'a' * 17)
    expect(team).to be_invalid
  end

  # チーム略称が0文字だと無効
  it 'is invalid with team_short_name 0 charactor' do
    team = FactoryBot.build(:team, team_short_name: '')
    expect(team).to be_invalid
  end

  # メンバーが所属していること
  it 'has many members' do
    team = FactoryBot.create(:team, :with_members)
    expect(team.members.length).to eq 9
  end

  # 試合を登録出来ること
  it 'has many games' do
    team = FactoryBot.create(:team, :with_games)
    expect(team.games.length).to eq 10
  end
end
