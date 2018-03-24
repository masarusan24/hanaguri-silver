class RemoveIndexFromGameRecord < ActiveRecord::Migration[5.1]
  def change
    remove_index :game_records, :team_id
  end
end
