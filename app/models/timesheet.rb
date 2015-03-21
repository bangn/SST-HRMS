class Timesheet < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  belongs_to :job
  auto_strip_attributes :description, :duration
  validates :description, length: {minimum: 5}
  validates :duration, presence: true, length: {minimum: 1}, numericality: {greater_than: 0}
  validates :working_date, presence: true

  def name
    job.nil? ? "Unknown" : job.name
  end

  def available_jobs
    return [] if user.available_jobs.blank?
    user.available_jobs
  end
end
