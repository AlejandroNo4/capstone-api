class Trip < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites

  validates :destiny, :price, :description, :days, :hotel, :trip_type, presence: true, length: { maximum: 50 }
  has_many_attached :images

end
