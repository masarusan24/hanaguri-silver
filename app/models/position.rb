class Position < ApplicationRecord
  has_many :position_relations
  has_many :positions, through: :position_relations, source: :batting_record
end
