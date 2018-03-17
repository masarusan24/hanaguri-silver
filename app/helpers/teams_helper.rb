module TeamsHelper
  def choose_new_or_edit_team
    if action_name == 'new'
      teams_path
    elsif action_name == 'edit'
      team_path
    end
  end
end
