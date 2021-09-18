class Api::V1::FavoritesController < ApplicationController
  include CurrentUserConcern

  def create
    @favorite = @current_user.favorites.build(trip_id: params['trip_id'])
    if @favorite.save
      render json: {
        favorite_trips: @current_user.trips
      }
    else
      render json: { status: 500, message: 'Unable to add.' }
    end
  end

  def destroy
    @favorite = @current_user.favorites.find_by(trip_id: params['trip_id'])
    @favorite.destroy
    render json: { message: 'Successfully deleted.' }, status: 200
  end
end
