class AddDetailToGameRelation < ActiveRecord::Migration[5.1]
  def change
    add_column :game_relations, :is_top, :boolean
    add_column :game_relations, :win, :boolean
    add_column :game_relations, :lose, :boolean
    add_column :game_relations, :draw, :boolean
  end
end
