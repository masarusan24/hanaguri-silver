class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]
  before_action :set_score, only: %i[show edit update destroy]
  before_action :redirect_to_login, only: %i[new edit update destroy]
  before_action :authorize_action, except: %i[index show]

  def new
    @game = my_team.games.build
    @score = @game.build_score
  end

  def create
    @game = my_team.games.build(game_params)
    @score = @game.build_score(score_params)
    set_other_game_params
    if @game.save
      redirect_to games_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  def index
    @year ||= params[:year] || Date.today.year
    @games = Game.index.where(year: @year, team_id: my_team.id).order(:date)
  end

  def edit; end

  def update
    set_other_game_params
    if @game.update(game_params) && @score.update(score_params)
      redirect_to games_path, flash: { success: t('.success') }
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @game.destroy
    redirect_to games_path, flash: { success: t('.success') }
  end

  private

  def game_params
    params.require(:game).permit(
      :year,
      :date,
      :team_top,
      :team_bottom,
      :ground,
      :bat_first,
      :runs,
      :runs_allowed,
      :is_win,
      :is_draw,
      :overview,
      score_attributes: [
        :game_id,
        :top_of_first,
        :top_of_second,
        :top_of_third,
        :top_of_fourth,
        :top_of_fifth,
        :top_of_sixth,
        :top_of_seventh,
        :top_of_eighth,
        :top_of_ninth,
        :top_of_tenth,
        :top_of_eleventh,
        :top_of_twelfth,
        :bottom_of_first,
        :bottom_of_second,
        :bottom_of_third,
        :bottom_of_fourth,
        :bottom_of_fifth,
        :bottom_of_sixth,
        :bottom_of_seventh,
        :bottom_of_eighth,
        :bottom_of_ninth,
        :bottom_of_tenth,
        :bottom_of_eleventh,
        :bottom_of_twelfth
      ])
  end

  def score_params
    params.require(:score).permit(
      :game_id,
      :top_of_first,
      :top_of_second,
      :top_of_third,
      :top_of_fourth,
      :top_of_fifth,
      :top_of_sixth,
      :top_of_seventh,
      :top_of_eighth,
      :top_of_ninth,
      :top_of_tenth,
      :top_of_eleventh,
      :top_of_twelfth,
      :bottom_of_first,
      :bottom_of_second,
      :bottom_of_third,
      :bottom_of_fourth,
      :bottom_of_fifth,
      :bottom_of_sixth,
      :bottom_of_seventh,
      :bottom_of_eighth,
      :bottom_of_ninth,
      :bottom_of_tenth,
      :bottom_of_eleventh,
      :bottom_of_twelfth
    )
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def set_score
    @score = Score.find_by(game_id: params[:id])
  end

  def redirect_to_login
    redirect_to new_session_path, flash: { warning: t(:please_login) } unless logged_in?
  end

  def get_total_score(bat_first)
    top_or_bottom = bat_first ? 'top_of' : 'bottom_of'
    score = 0
    params[:score].each do |key, value|
      score += value.to_i if key.include?(top_or_bottom)
    end
    score
  end

  def win?
    @game.runs > @game.runs_allowed
  end

  def draw?
    @game.runs == @game.runs_allowed
  end

  def set_other_game_params
    @game.year = params[:game][:date].to_date.year unless params[:game][:date].to_date.nil?
    @game.runs = get_total_score(@game.bat_first)
    @game.runs_allowed = get_total_score(!@game.bat_first)
    @game.is_win = win?
    @game.is_draw = draw?
  end

  def default_url_options(options = { year: Date.today.year })
    { locale: I18n.locale }.merge options
  end

  def authorize_action
    authorize! @game
  end
end
