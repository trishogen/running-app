class Run < ApplicationRecord
  belongs_to :user
  belongs_to :route

  validates :date, presence: true
  validates :run_time, presence: true, numericality: { only_integer: true }
  validates :mood, presence: true, format: { without: /[0-9]/,
    message: "does not allow numbers" }

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :route_id, presence: true, numericality: { only_integer: true }


end
