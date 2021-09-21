class Api::V1::StaticController < ApplicationController
  def home
    render json: { status: 'Index connected' }
  end
end
