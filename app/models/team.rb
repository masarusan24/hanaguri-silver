class Team < ApplicationRecord
  validates :team_name, length: { in: 1..255 }
  validates :team_short_name, length: { in: 1..16 }
  mount_uploader :logo, ImageUploader
end
