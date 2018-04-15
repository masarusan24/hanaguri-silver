class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]
  before_action :redirect_to_login, only: %i[new edit create destroy]
  before_action :authorize_action, only: %i[new create edit update destroy]

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path, flash: { info: t('.success') }
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def index
    @members = Member.index.order(:id)
  end

  def update
    if @member.update(member_params)
      redirect_to member_path(@member.name), flash: { info: t('.success') }
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to members_path, flash: { danger: t('.success') }
  end

  private

  def set_member
    @member = Member.find_by(name: params[:name])
  end

  def member_params
    params.require(:member).permit(
      :name,
      :full_name,
      :uniform_number,
      :position,
      :image,
      :introduction,
      :team_id
    )
  end

  def redirect_to_login
    unless logged_in?
      redirect_to new_session_path, flash: { warning: t(:please_login) }
    end
  end

  def authorize_action
    authorize! @member
  end
end
