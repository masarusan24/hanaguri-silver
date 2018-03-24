class CreatePositionRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :position_relations do |t|
      t.integer :batting_record_id
      t.integer :position_id

      t.timestamps
    end
  end
end
