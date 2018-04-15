class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :redirect_to_login, only: %i[new show edit destroy]
  before_action :authorize_action, only: %i[new create edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  def edit() end

  def update
    if @user.update(user_params)
      redirect_to users_path, flash: { info: t('.success') }
    else
      render :edit
    end
  end

  def show() end

  def admin() end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    redirect_to users_path, flash: { danger: t('.success') }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find_by(name: params[:name])
  end

  def redirect_to_login
    unless logged_in?
      redirect_to new_session_path, flash: { warning: t(:please_login) }
    end
  end

  def authorize_action
    authorize! @user
  end
end
