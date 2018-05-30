class TeamsController < ApplicationController
  before_action :set_teams, only: %i[show edit update destroy]
  before_action :get_year, only: %i[show]
  before_action :redirect_to_login, only: %i[new edit create destroy]
  before_action :authorize_action, only: %i[new create edit update destroy]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  def index
    @teams = Team.index
  end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to teams_path, flash: { success: t('.success') }
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @team.destroy
    redirect_to teams_path, flash: { success: t('.success') }
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :team_short_name, :home_ground, :overview, :logo)
  end

  def set_teams
    @team = Team.find_by(team_short_name: params[:team_short_name])
  end

  def get_year
    @year ||= params[:year] || Date.today.year
  end

  def redirect_to_login
    unless logged_in?
      redirect_to new_session_path, flash: { warning: t(:please_login) }
    end
  end

  def authorize_action
    authorize! @team
  end
end
