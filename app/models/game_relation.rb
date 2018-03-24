class GameRelation < ApplicationRecord
  belongs_to :team
  belongs_to :game_record
end
