class Trip < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :destination, :price, :description, :days, :hotel, :trip_type, presence: true, length: { maximum: 50 }
  has_many_attached :images
end
