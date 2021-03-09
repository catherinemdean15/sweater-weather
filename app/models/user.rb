class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates_uniqueness_of :email
  validates :password, presence: true, confirmation: true

end
