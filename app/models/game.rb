class Game < ApplicationRecord
  # has_one association with InningsDetail model
  has_one :score, dependent: :destroy
  accepts_nested_attributes_for :score

  # belongs_to Team model
  belongs_to :team

  # multiple association with BattingRecord model
  # has_many :batting_records, dependent: :destroy
  # has_many :batting_members, through: :batting_records, source: :member

  # multiple association with PitchingRecord model
  # has_many :pitching_records, dependent: :destroy
  # has_many :pitching_members, through: :pitching_records, source: :member

  # validates presence date
  validates :date, presence: true

  # validates presence team name
  validates :team_top, presence: true
  validates :team_bottom, presence: true
end
