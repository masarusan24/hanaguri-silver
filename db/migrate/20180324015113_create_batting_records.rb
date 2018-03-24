class CreateBattingRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :batting_records do |t|
      t.integer :member_id
      t.integer :game_record_id

      t.integer :batting_order
      t.integer :plate_appearance
      t.integer :at_bat
      t.integer :hit
      t.integer :two_base_hit
      t.integer :three_base_hit
      t.integer :home_run
      t.integer :rbi
      t.integer :strack_out
      t.integer :bb_hbp
      t.integer :sacrifice_bunt
      t.integer :sacrifice_fly
      t.integer :stolen_base

      t.timestamps
    end
  end
end
