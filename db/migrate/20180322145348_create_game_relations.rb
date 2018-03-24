class CreateGameRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :game_relations do |t|
      t.integer :team_id
      t.integer :game_record_id

      t.timestamps
    end
  end
end
