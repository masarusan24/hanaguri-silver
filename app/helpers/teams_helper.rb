module TeamsHelper
  def choose_new_or_edit_team
    if action_name == 'new'
      teams_path
    elsif action_name == 'edit'
      team_path
    end
  end

  def wins(year)
    wins = 0
    @team.games.where(year: year).each do |game|
      wins += 1 if game.is_win
    end
    wins
  end

  def draws(year)
    draws = 0
    @team.games.where(year: year).each do |game|
      draws += 1 if game.is_draw
    end
    draws
  end

  def loses(year)
    loses = 0
    @team.games.where(year: year).each do |game|
      loses += 1 unless game.is_win || game.is_draw
    end
    loses
  end

  def win_rate(year)
    sprintf("%.3f", wins(year) / @team.games.where(year: year).count.to_f)
  end

  def total_runs(year)
    runs = 0
    @team.games.where(year: year).each do |game|
      runs += game.runs
    end
    runs
  end

  def total_runs_allowed(year)
    runs_allowed = 0
    @team.games.where(year: year).each do |game|
      runs_allowed += game.runs_allowed
    end
    runs_allowed
  end
end
