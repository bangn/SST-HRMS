class Timesheet < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  belongs_to :job
  auto_strip_attributes :description, :duration, :squish => true
  validates :description, length: {minimum: 5}
  validates :duration, presence: true, length: {minimum: 1}, numericality: {greater_than: 0}
  validates :working_date, presence: true
  
  def name
    job.nil? ? "Unknown" : job.name
  end
  
  def details
    "Date: #{working_date.strftime("%d-%m-%Y")} - Duration: #{duration} - Description: #{description}"
  end

  def available_jobs
    user.available_jobs.map {|job| {value: job.id, text: job.name}}
  end
end
