class AddColumnsToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :bat_first, :boolean
    add_column :games, :runs, :integer
    add_column :games, :runs_allowed, :integer
    add_column :games, :is_win, :boolean
    add_column :games, :is_draw, :boolean
    add_column :games, :overview, :text
  end
end
