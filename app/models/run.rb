class Run < ApplicationRecord
  belongs_to :user
  belongs_to :route

  validates :title, presence: true
  validates :date, presence: true
  validates :run_time, presence: true, numericality: { greater_than_or_equal_to: 0.1}
  validates :mood, presence: true, format: { without: /[0-9]/,
    message: "does not allow numbers" }

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :route_id, presence: true, numericality: { only_integer: true }

  def self.total_run_time
    total_run_time = self.sum("run_time")
  end

end
