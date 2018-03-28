class GameRecord < ApplicationRecord
  # has_one association with InningsDetail model
  has_one :innings_detail
  accepts_nested_attributes_for :innings_detail

  # multiple association with Team model
  has_many :game_relations, dependent: :destroy
  has_many :teams, through: :game_relations, source: :team
  accepts_nested_attributes_for :game_relations

  # multiple association with BattingRecord model
  has_many :batting_records, dependent: :destroy
  has_many :batting_members, through: :batting_records, source: :member

  # multiple association with PitchingRecord model
  has_many :pitching_records, dependent: :destroy
  has_many :pitching_members, through: :pitching_records, source: :member
end
