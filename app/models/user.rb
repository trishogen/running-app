class User < ApplicationRecord
  has_secure_password
  has_many :runs
  has_many :routes, through: :runs

  validates :email, uniqueness: true, presence: true, format: { with:
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates_confirmation_of :password
  validates :first_name, presence: true, format: { without: /[0-9]/,
    message: "does not allow numbers" }

end
