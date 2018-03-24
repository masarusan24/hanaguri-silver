class RemoveInningsFromGameRecord < ActiveRecord::Migration[5.1]
  def change
    remove_column :game_records, :score, :integer
    remove_column :game_records, :win, :boolean
    remove_column :game_records, :lose, :boolean
    remove_column :game_records, :draw, :boolean
    remove_column :game_records, :top_or_bottom, :boolean
    remove_column :game_records, :first_inning, :integer
    remove_column :game_records, :second_inning, :integer
    remove_column :game_records, :third_inning, :integer
    remove_column :game_records, :fourth_inning, :integer
    remove_column :game_records, :fifth_inning, :integer
    remove_column :game_records, :sixth_inning, :integer
    remove_column :game_records, :seventh_inning, :integer
    remove_column :game_records, :eighth_inning, :integer
    remove_column :game_records, :ninth_inning, :integer
    remove_column :game_records, :tenth_inning, :integer
    remove_column :game_records, :eleventh_inning, :integer
    remove_column :game_records, :twelfth_inning, :integer
  end
end
