class User < ApplicationRecord
  has_secure_password validations: false
  has_many :runs
  has_many :routes, through: :runs

  validates :email, uniqueness: true, presence: true, format: { with:
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  validates :password, confirmation: true, unless: :from_omniauth?
  validates :password, length: { minimum: 8 }, unless: :from_omniauth?

  validates :first_name, presence: true, format: { without: /[0-9]/,
    message: "does not allow numbers" }

  def from_omniauth?
    self.uid != nil
  end

end
