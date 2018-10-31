class Member < ApplicationRecord
  belongs_to :team, optional: true
  has_many :batting_records, dependent: :destroy
  has_many :pitching_records, dependent: :destroy
  has_many :game_records, through: :batting_records, source: :game_record
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :full_name, presence: true, length: { maximum: 30 }
  mount_uploader :image, ImageUploader
end
