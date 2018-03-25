class CreateInningsDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :innings_details do |t|
      t.integer :top_of_first
      t.integer :top_of_second
      t.integer :top_of_third
      t.integer :top_of_fourth
      t.integer :top_of_fifth
      t.integer :top_of_sixth
      t.integer :top_of_seventh
      t.integer :top_of_eighth
      t.integer :top_of_ninth
      t.integer :top_of_tenth
      t.integer :top_of_eleventh
      t.integer :top_of_twelfth
      t.integer :bottom_of_first
      t.integer :bottom_of_second
      t.integer :bottom_of_third
      t.integer :bottom_of_fourth
      t.integer :bottom_of_fifth
      t.integer :bottom_of_sixth
      t.integer :bottom_of_seventh
      t.integer :bottom_of_eighth
      t.integer :bottom_of_ninth
      t.integer :bottom_of_tenth
      t.integer :bottom_of_eleventh
      t.integer :bottom_of_twelfth

      t.timestamps
    end
  end
end
