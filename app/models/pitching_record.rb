class PitchingRecord < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :game_record, optional: true
end
