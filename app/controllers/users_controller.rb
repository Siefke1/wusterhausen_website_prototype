class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to user_board_path
    else
      render "new"
      raise
    end
    authorize @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to user_board_path
  end

  private
  def user_params
    params.require(:user).permit(:id, :email, :password)
  end

end