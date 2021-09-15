class Api::V1::TripsController < ApplicationController
  include CurrentUserConcern
  before_action :admin?, only: %i[create update destroy]

  def show
    @trip = Trip.find(params[:id])
    render json: @trip
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      session[:trip_id] = @trip.id
      render json: {
        status: :created,
        trip: @trip
      }
    else
      render json: { status: 500 }
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip
      @trip.update(trip_params)
      render json: { message: 'Successfully updated.' }, status: 200
    else
      render error: { error: 'Unable to update.' }, status: 400
    end
  end

  def destroy
    @trip = Trip.where(id: params[:id]).first
    if @trip.destroy
      render json: { message: 'Successfully deleted.' }, status: 200
    else
      head(:unprocessable_entity)
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:destiny, :price, :description, :days, :hotel, :trip_type)
  end

  def admin?
    render json: { message: 'Access Denied' } unless @current_user && @current_user.admin == true
  end
end