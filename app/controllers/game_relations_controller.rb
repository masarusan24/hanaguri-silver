class GameRelationsController < ApplicationController
  def create
    my_team.game_relations.create(team_id: params[:team_id])
  end

  def destroy
    my_team.game_relations.find_by(team_id: params[:team_id]).destroy
  end
end
