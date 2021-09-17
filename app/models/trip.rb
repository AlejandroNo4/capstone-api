class Trip < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites

  has_many_attached :images
end
