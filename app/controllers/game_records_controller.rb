class GameRecordsController < ApplicationController
  before_action :set_game_record, only: %i[show edit update destroy]
  before_action :redirect_to_login, only: %i[new edit update destroy]

  def new
    @game_record = my_team.games.build
  end

  def create
    @game_record = my_team.games.build(game_record_params)
    if game_record.save
      redirect_to game_records_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  def index
    @game_records = GameRecord.all
  end

  def edit
  end

  def update
    if @game_record.update(game_record_params)
      redirect_to game_records_path, flash: { success: t('.success') }
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @game_record.destroy
    redirect_to game_records_path, flash: { danger: t('.success') }
  end

  private

  def game_record_params
    params.require(:game_record).permit(:year, :date, :ground)
  end

  def set_game_record
    @game_record = GameRecord.find(params[:id])
  end

  def redirect_to_login
    redirect_to new_session_path, flash: { warning: t(:please_login) } unless logged_in?
  end
end
