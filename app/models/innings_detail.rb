class InningsDetail < ApplicationRecord
  belongs_to :game_record, dependent: :destroy
end
