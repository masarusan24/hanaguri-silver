class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.name), flash: { success: t('.success') }
    else
      render :new
    end
  end

  def edit() end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.name), flash: { info: t('.success') }
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(name: params[:name])
  end
end
