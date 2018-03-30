module ScoresHelper
  def choose_new_or_edit_score
    if action_name == 'new' || action_name == 'confirm'
      scores_path
    elsif action_name == 'edit'
      score_path
    end
  end
end
