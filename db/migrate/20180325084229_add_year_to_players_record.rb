class AddYearToPlayersRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :batting_records, :year, :integer
    add_column :pitching_records, :year, :integer
  end
end
