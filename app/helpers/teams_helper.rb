module TeamsHelper
  def choose_new_or_edit_team
    if action_name == 'new'
      teams_path
    elsif action_name == 'edit'
      team_path
    end
  end

  def wins
    wins = 0
    @team.games.each do |game|
      wins += 1 if game.is_win
    end
    wins
  end

  def draws
    draws = 0
    @team.games.each do |game|
      draws += 1 if game.is_draw
    end
    draws
  end

  def loses
    loses = 0
    @team.games.each do |game|
      loses += 1 unless game.is_win || game.is_draw
    end
    loses
  end

  def win_rate
    sprintf("%.3f", wins / @team.games.count.to_f)
  end

  def total_runs
    runs = 0
    @team.games.each do |game|
      runs += game.runs
    end
    runs
  end

  def total_runs_allowed
    runs_allowed = 0
    @team.games.each do |game|
      runs_allowed += game.runs_allowed
    end
    runs_allowed
  end
end
