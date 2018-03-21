class Member < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :full_name, presence: true, length: { maximum: 30 }
  mount_uploader :image, ImageUploader
end
