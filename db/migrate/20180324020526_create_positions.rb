class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :position_name
      t.string :position_short_name

      t.timestamps
    end
  end
end
