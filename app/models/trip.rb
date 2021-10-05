class Trip < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :destination, :price, :days, :hotel, :trip_type, :description, presence: true, on: :create
  validates :destination, :price, :days, :hotel, :trip_type, length: { maximum: 50 }
  validates :description, length: { maximum: 400 }
  has_many_attached :images

  default_scope -> { order(created_at: :desc) }
end
