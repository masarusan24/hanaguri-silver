class RemoveInningsTopBottom2FromGameRecord < ActiveRecord::Migration[5.1]
  def change
    remove_column :game_records, :top_of_first, :integer
    remove_column :game_records, :top_of_second, :integer
    remove_column :game_records, :top_of_third, :integer
    remove_column :game_records, :top_of_fourth, :integer
    remove_column :game_records, :top_of_fifth, :integer
    remove_column :game_records, :top_of_sixth, :integer
    remove_column :game_records, :top_of_seventh, :integer
    remove_column :game_records, :top_of_eighth, :integer
    remove_column :game_records, :top_of_ninth, :integer
    remove_column :game_records, :top_of_tenth, :integer
    remove_column :game_records, :top_of_eleventh, :integer
    remove_column :game_records, :top_of_twelfth, :integer
    remove_column :game_records, :bottom_of_first, :integer
    remove_column :game_records, :bottom_of_second, :integer
    remove_column :game_records, :bottom_of_third, :integer
    remove_column :game_records, :bottom_of_fourth, :integer
    remove_column :game_records, :bottom_of_fifth, :integer
    remove_column :game_records, :bottom_of_sixth, :integer
    remove_column :game_records, :bottom_of_seventh, :integer
    remove_column :game_records, :bottom_of_eighth, :integer
    remove_column :game_records, :bottom_of_ninth, :integer
    remove_column :game_records, :bottom_of_tenth, :integer
    remove_column :game_records, :bottom_of_eleventh, :integer
    remove_column :game_records, :bottom_of_twelfth, :integer
  end
end
