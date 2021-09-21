class Api::V1::SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.find_by(email: params['user']['email'])

    if user.present? && user.authenticate(params['user']['password'])
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user,
        favorites: user.trips
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
      render json: @current_user, serializer: UserSerializer
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {
      status: 200,
      logged_out: true
    }
  end
end
