class RemoveForeignKeyFromGameRecord < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :game_records, column: :team_id
  end
end
