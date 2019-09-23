module GamesHelper
  def my_team
    if current_user.present?
      @team = current_user.name == 'test' ? Team.find_by(team_short_name: 'test') : Team.find_by(team_short_name: 'silver')
    else
      @team = Team.find_by(team_short_name: 'silver')
    end
  end

  def choose_new_or_edit_game
    if action_name == 'new' || action_name == 'confirm'
      games_path
    elsif action_name == 'edit'
      game_path
    end
  end
end
