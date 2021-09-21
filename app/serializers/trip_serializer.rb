class TripSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  def trip_images
    object.images.map{|img| ({ image: url_for(img) })} || [""]
  end
  attributes :id, :destiny, :price, :description, :days, :hotel, :trip_type, :trip_images
end


