class User < ApplicationRecord
  has_secure_password
  has_many :favourites
  has_many :trips, through: :favourites

  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
