class StaticController < ApplicationController
  def home
    render json: {status: 'workkkk'} 
  end
end