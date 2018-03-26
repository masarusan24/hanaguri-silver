module GameRecordsHelper
  def my_team
    @my_team = Team.find_by(team_short_name: 'silver')
  end

  def choose_new_or_edit_game_record
    if action_name == 'new' or action_name == 'confirm'
      game_records_path
    elsif action_name == 'edit'
      game_record_path
    end
  end
end
