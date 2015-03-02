class Timesheet < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  auto_strip_attributes :description, :duration, :squish => true
  validates :description, length: {minimum: 5}
  validates :duration, presence: true, length: {minimum: 1}, numericality: {greater_than: 0}
  validates :working_date, presence: true
  
  alias_attribute :name, :working_date
end