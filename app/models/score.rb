class Score < ApplicationRecord
  belongs_to :game, dependent: :destroy
end
