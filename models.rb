# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :ratings, dependent: :destroy
  validates :name, length: { in: 20..60 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { in: 8..16 }, format: { with: /\A(?=.*[A-Z])(?=.*\W)/ }
end

# app/models/store.rb
class Store < ApplicationRecord
  has_many :ratings, dependent: :destroy
end

# app/models/rating.rb
class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :store
  validates :score, inclusion: { in: 1..5 }
end
