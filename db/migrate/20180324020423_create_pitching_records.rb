class CreatePitchingRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :pitching_records do |t|
      t.integer :member_id
      t.integer :game_record_id

      t.integer :win
      t.integer :lose
      t.integer :save
      t.integer :inning
      t.integer :run
      t.integer :earned_run
      t.integer :home_run
      t.integer :strikeout
      t.integer :bb_hbp

      t.timestamps
    end
  end
end
