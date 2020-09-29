class Route < ApplicationRecord
  has_many :runs
  has_many :users, through: :runs
  belongs_to :creator, class_name: :User

  validates :title, presence: true, uniqueness: true
  validates :location, presence: true
  validates :distance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :elevation, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  # routes with the most runs, for stats page
  scope :most_popular_route, -> { Route.joins(:runs).group(:routes).order(
    Arel.sql('count(routes.id) desc')).first}
end
