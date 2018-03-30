module GamesHelper
  def my_team
    @team = Team.find_by(team_short_name: 'silver')
  end

  def choose_new_or_edit_game
    if action_name == 'new' || action_name == 'confirm'
      games_path
    elsif action_name == 'edit'
      game_path
    end
  end
end
