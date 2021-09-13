class StaticController < ApplicationController
  def home
    render json: { status: 'This worked!' }
  end
end
