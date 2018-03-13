class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :team_short_name
      t.string :home_ground
      t.text :overview
      t.string :logo

      t.timestamps
    end
  end
end
