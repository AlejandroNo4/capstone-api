class Api::V1::UsersController < ApplicationController
  include CurrentUserConcern

  def show
    user = User.find(params[:id])
    render json: user, serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: user, serializer: UserSerializer, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if @current_user == user && user.update(user_params)
      render json: user, serializer: UserSerializer, status: 200
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.where(id: params[:id]).first
    if @current_user == user && user.destroy
      render json: { message: 'Successfully deleted.' }, status: 200
    else
      render json: { message: 'Access denied' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :image, :password, :password_confirmation)
  end
end
