class ScoresController < ApplicationController
  before_action :set_score, only: %i[show edit update destroy]
  before_action :redirect_to_login, only: %i[new edit update destroy]

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)
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

  def set_score
    @score = Score.find(params[:id])
  end

  def redirect_to_login
    redirect_to new_session_path, flash: { warning: t(:please_login) } unless logged_in?
  end
end
