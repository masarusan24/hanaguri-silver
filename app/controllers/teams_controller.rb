class TeamsController < ApplicationController
  before_action :set_teams, only: %i[show edit update destroy]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, flash: { success: 'チームを作成しました' }
    else
      render :new
    end
  end

  def index
    @teams = Team.all
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to teams_path, flash: { info: 'チーム情報を更新しました' }
    else
      render :edit
    end
  end

  def show
  end

  private
  def team_params
    params.require(:team).permit(:team_name, :team_short_name, :home_ground, :overview, :logo)
  end

  def set_teams
    @team = Team.find(params[:id])
  end
end
