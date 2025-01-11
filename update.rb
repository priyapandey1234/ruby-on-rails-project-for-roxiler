class User < ApplicationRecord
  rolify
  has_many :ratings
  has_many :stores, through: :ratings

  # Validations
  validates :name, presence: true, length: { in: 20..60 }
  validates :address, presence: true, length: { maximum: 400 }
  validates :password, length: { in: 8..16 },
                       format: { with: /(?=.*[A-Z])(?=.*\W)/, message: 'must contain at least one uppercase and one special character' }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end


class Store < ApplicationRecord
  has_many :ratings
  validates :name, presence: true, length: { in: 20..60 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, presence: true, length: { maximum: 400 }

  def average_rating
    ratings.average(:rating)&.round(2) || 0.0
  end
end


class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :store

  # Validation
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
