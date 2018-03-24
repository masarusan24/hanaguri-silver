class Team < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :game_relation, dependent: :destroy
  has_many :games, through: :game_relation, source: :game_record
  validates :team_name, length: { in: 1..255 }
  validates :team_short_name, length: { in: 1..16 }
  mount_uploader :logo, ImageUploader
end
