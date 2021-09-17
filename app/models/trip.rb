class Trip < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites

  validates :destiny, :price, :description, :days, :hotel, :trip_type, presence: true, length: { maximum: 50 }
  has_many_attached :images
end
