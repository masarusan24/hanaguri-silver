class CreateGameRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :game_records do |t|
      t.integer :year
      t.date :date
      t.string :ground
      t.integer :score
      t.boolean :win
      t.boolean :lose
      t.boolean :draw
      t.boolean :top_or_bottom
      t.integer :first_inning
      t.integer :second_inning
      t.integer :third_inning
      t.integer :fourth_inning
      t.integer :fifth_inning
      t.integer :sixth_inning
      t.integer :seventh_inning
      t.integer :eighth_inning
      t.integer :ninth_inning
      t.integer :tenth_inning
      t.integer :eleventh_inning
      t.integer :twelfth_inning

      t.timestamps
    end
  end
end
