class PositionRelation < ApplicationRecord
  belongs_to :positions, optional: true
  belongs_to :batting_records, optional: true
end
