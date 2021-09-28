class Api::V1::TripsController < ApplicationController
  include CurrentUserConcern
  before_action :admin?, only: %i[create update destroy]

  def index
    trips = Trip.all
    render json: trips
  end

  def show
    @trip = Trip.find(params[:id])
    render json: @trip, serializer: TripSerializer
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      session[:trip_id] = @trip.id
      render json: @trip, serializer: TripSerializer, status: :created
    else
      render json: @trip.errors, status: :unprocessable_entity
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
    params.require(:trip).permit(:destination, :price, :description, :days, :hotel, :trip_type, images: [])
  end

  def admin?
    render json: { message: 'Access Denied' } unless @current_user && @current_user.admin == true
  end
end
