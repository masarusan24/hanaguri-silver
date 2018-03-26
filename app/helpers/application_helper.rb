module ApplicationHelper
  def my_team
    @my_team = Team.find_by(team_short_name: 'silver')
  end
end
