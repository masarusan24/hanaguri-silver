class AddTeamRefToGameRecord < ActiveRecord::Migration[5.1]
  def change
    add_reference :game_records, :team, foreign_key: true
  end
end
