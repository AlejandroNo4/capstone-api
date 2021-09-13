class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      email: params['user']['email'],
      password: params['user']['password'],
      password_confrimation: params['user']['password_confirmation']
    )
    if user
      session[:user_id] = user.idrender json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 500 }
    end
  end
end