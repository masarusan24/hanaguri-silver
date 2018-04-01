class Score < ApplicationRecord
  belongs_to :game, dependent: :destroy

  # validates :top_of_first, greater_than_or_equal_to: 0
  # validates :top_of_second, greater_than_or_equal_to: 0
  # validates :top_of_third, greater_than_or_equal_to: 0
  # validates :top_of_fourth, greater_than_or_equal_to: 0
  # validates :top_of_fifth, greater_than_or_equal_to: 0
  # validates :top_of_sixth, greater_than_or_equal_to: 0
  # validates :top_of_seventh, greater_than_or_equal_to: 0
  # validates :top_of_eighth, greater_than_or_equal_to: 0
  # validates :top_of_ninth, greater_than_or_equal_to: 0
  # validates :top_of_tenth, greater_than_or_equal_to: 0
  # validates :top_of_eleventh, greater_than_or_equal_to: 0
  # validates :top_of_twelfth, greater_than_or_equal_to: 0
  # validates :bottom_of_first, greater_than_or_equal_to: 0
  # validates :bottom_of_second, greater_than_or_equal_to: 0
  # validates :bottom_of_third, greater_than_or_equal_to: 0
  # validates :bottom_of_fourth, greater_than_or_equal_to: 0
  # validates :bottom_of_fifth, greater_than_or_equal_to: 0
  # validates :bottom_of_sixth, greater_than_or_equal_to: 0
  # validates :bottom_of_seventh, greater_than_or_equal_to: 0
  # validates :bottom_of_eighth, greater_than_or_equal_to: 0
  # validates :bottom_of_ninth, greater_than_or_equal_to: 0
  # validates :bottom_of_tenth, greater_than_or_equal_to: 0
  # validates :bottom_of_eleventh, greater_than_or_equal_to: 0
  # validates :bottom_of_twelfth, greater_than_or_equal_to: 0
end
