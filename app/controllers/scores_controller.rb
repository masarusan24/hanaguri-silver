class ScoresController < ApplicationController
  # before_action :set_game, only: %i[new create show edit update destroy]
  before_action :set_score, only: %i[show edit update destroy]
  before_action :redirect_to_login, only: %i[new edit update destroy]

  def new
    @score = @game.build_score
  end

  def create
    @score = @game.build_score(score_params)
    if @score.save
      redirect_to game_path(score_params), flash: { success: t('.success') }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @score.destroy(score_params)
      redirect_to games_path, flash: { info: t('.success') }
    else
      render :edit
    end
  end

  def destroy
    @score.destroy
    redirect_to games_path, flash: { danger: t('.success') }
  end

  private

  def score_params
    params.require(:score).permit(
        :gamae_id,
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

  def set_score
    @score = Score.find(params[:id])
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def redirect_to_login
    redirect_to new_session_path, flash: { warning: t(:please_login) } unless logged_in?
  end
end
