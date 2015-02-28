class Timesheet < ActiveRecord::Base
  paginates_per 10
  auto_strip_attributes :description, :duration, :squish => true
  validates :description, length: {minimum: 2}
  validates :duration, presence: true, length: {minimum: 1}, numericality: {greater_than: 0}
  
  def description
    ""
  end
end