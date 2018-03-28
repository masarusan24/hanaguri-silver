class GameRecordsController < ApplicationController
  before_action :set_game_record, only: %i[show edit update destroy]
  before_action :redirect_to_login, only: %i[new edit update destroy]

  def new
    @game_record = my_team.games.build
    @game_record.build_innings_detail
    # @game_relation = @game_record.game_relations.build
  end

  def create
    @game_record = my_team.games.build(game_record_params)
    # @game_relation = @game_record.game_relations.build(game_relation_params)
    if @game_record.save
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
    params.require(:game_record).permit(:year, :date, :ground, :innings_detail_attributes)
  end

  def innings_detail_params
    params.require(:innings_detail).permit(
      :game_record_id,
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

  # def game_relation_params
  #   params.require(:game_relation).permit(:team_id, :game_record_id, :is_top, :win, :lose, :draw)
  # end

  def set_game_record
    @game_record = GameRecord.find(params[:id])
  end

  def redirect_to_login
    redirect_to new_session_path, flash: { warning: t(:please_login) } unless logged_in?
  end
end
