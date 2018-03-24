class AddInningsDetailToGameRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :game_records, :top_of_first, :integer
    add_column :game_records, :top_of_second, :integer
    add_column :game_records, :top_of_third, :integer
    add_column :game_records, :top_of_fourth, :integer
    add_column :game_records, :top_of_fifth, :integer
    add_column :game_records, :top_of_sixth, :integer
    add_column :game_records, :top_of_seventh, :integer
    add_column :game_records, :top_of_eighth, :integer
    add_column :game_records, :top_of_ninth, :integer
    add_column :game_records, :top_of_tenth, :integer
    add_column :game_records, :top_of_eleventh, :integer
    add_column :game_records, :top_of_twelfth, :integer
    add_column :game_records, :bottom_of_first, :integer
    add_column :game_records, :bottom_of_second, :integer
    add_column :game_records, :bottom_of_third, :integer
    add_column :game_records, :bottom_of_fourth, :integer
    add_column :game_records, :bottom_of_fifth, :integer
    add_column :game_records, :bottom_of_sixth, :integer
    add_column :game_records, :bottom_of_seventh, :integer
    add_column :game_records, :bottom_of_eighth, :integer
    add_column :game_records, :bottom_of_ninth, :integer
    add_column :game_records, :bottom_of_tenth, :integer
    add_column :game_records, :bottom_of_eleventh, :integer
    add_column :game_records, :bottom_of_twelfth, :integer
  end
end
