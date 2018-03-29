class AddGameRecordToInningsDetail < ActiveRecord::Migration[5.1]
  def change
    add_reference :innings_details, :game_record, foreign_key: true
  end
end
