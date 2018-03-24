class GameRecord < ApplicationRecord
  # multiple association with Team model
  has_many :game_relations, dependent: :destroy
  has_many :teams, through: :game_relations, source: :team

  # multiple association with BattingRecord model
  has_many :batting_records, dependent: :destroy
  has_many :batting_members, through: :batting_records, source: :member

  # multiple association with PitchingRecord model
  has_many :pitching_records, dependent: :destroy
  has_many :pitching_members, through: :pitching_records, source: :member
end
