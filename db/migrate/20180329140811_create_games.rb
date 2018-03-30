class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :year
      t.date :date
      t.string :team_top
      t.string :team_bottom
      t.string :ground

      t.timestamps
    end
  end
end
