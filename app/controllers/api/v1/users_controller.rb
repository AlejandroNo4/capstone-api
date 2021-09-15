class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: {
      user: @user,
      favourites: @user.trips
    }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: {
        status: :created,
        user: @user,
        favourites: @user.trips
      }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: { message: 'Successfully updated.' }, status: 200
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.where(id: params[:id]).first
    if @user.destroy
      render json: { message: 'Successfully deleted.' }, status: 200
    else
      head(:unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end