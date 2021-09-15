class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_secure_password
  has_many :favourites
  has_many :trips, through: :favourites
  has_one_attached :image

  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def get_image_url
    url_for(self.image)
  end
end
