class Api::V1::FavouritesController < ApplicationController
  include CurrentUserConcern

  def create
    @favourite = @current_user.favourites.build(trip_id: params['trip_id'])
    if @favourite.save
      render json: {
        favourite_trips: @current_user.trips
      }
    else
      render json: { status: 500, message: 'Unable to add.' }
    end
  end

  def destroy
    @favourite = @current_user.favourites.find_by(trip_id: params['trip_id'])
    @favourite.destroy
    render json: { message: 'Successfully deleted.' }, status: 200
  end
end
