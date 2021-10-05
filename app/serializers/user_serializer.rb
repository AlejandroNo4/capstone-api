class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  def user_thumnail
    object.image.attached? ? url_for(object.image) : ['']
  end

  def logged_in
    true
  end
  attributes :id, :username, :email, :user_thumnail, :logged_in, :admin

  has_many :trips, serializer: TripSerializer
end
