class User < ApplicationRecord
  has_secure_password validations: false
  has_many :runs
  has_many :routes, through: :runs
  has_many :routes, foreign_key: :creator_id

  # user who has run the most miles (for stats page)
  scope :most_miles_run, -> { joins(runs: :route).group(:id).order(
    Arel.sql('sum(routes.distance) desc')).first }

  validates :email, uniqueness: true, presence: true, format: { with:
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  validates :password, confirmation: true, unless: :from_omniauth?
  validates :password, length: { minimum: 8 }, unless: :from_omniauth?

  validates :first_name, presence: true, format: { without: /[0-9]/,
    message: "does not allow numbers" }

  def from_omniauth?
    !self.uid.nil?
  end

  def been_on_run(run)
    # used to authorize users to see runs
    self.runs.include?(run)
  end


end
