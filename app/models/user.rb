class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_secure_password
  has_many :favorites
  has_many :trips, through: :favorites
  has_one_attached :image

  
  validates :email, :username, length: { minimum: 4, maximum: 50 }, presence: true, uniqueness: { case_sensitive: false }
  validates :password, :password_confirmation, presence: true, length: { minimum: 6 }
  validates :email, format: { with: /\A\S+@.+\.\S+\z/, message: "Email invalid"  }

  def get_image_url
    if self.image.attached?
      url_for(self.image)
    end
  end
end
