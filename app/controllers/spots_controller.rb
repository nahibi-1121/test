class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      flash[:success] = 'You have created book successfully.'
      redirect_to spot_path(@spot.id)
    else
      @spots = Spot.all
      @user = current_user
      render :new
    end
  end

  def index_japan
    @spots = Spot.all
  end

  def index_abroad
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @user = @spot.user
  end

  def edit
    @spot = Spot.find(params[:id])
    if @spot.user == current_user
      render :edit
    else
      redirect_to spot_index_japan_path
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      flash[:success] = 'You have updated book successfully.'
      redirect_to spot_path(@spot.id)
    else
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    @user = current_user
    redirect_to user_path(@user.id)
  end

  private

  def spot_params
    params.require(:spot).permit(:area, :spot_name, :image, :caption).merge(user_id:current_user.id)
  end
end
