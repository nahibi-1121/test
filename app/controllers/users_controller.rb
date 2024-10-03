class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]

  def index
    @users = User.all
    @user = current_user
    @spot = Spot.new
  end

  def show
    @user = User.find(params[:id])
    @spots = Spot.all
    @spotjapan = Spot.where(area:"国内", user_id:params[:id])
    @spotabroad = Spot.where(area:"海外", user_id:params[:id])
    @spot = Spot.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:success] = 'You have updated user successfully.'
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end
