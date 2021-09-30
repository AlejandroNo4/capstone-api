class Trip < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :destination, :price, :days, :hotel, :trip_type, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 400 }
  has_many_attached :images
end
