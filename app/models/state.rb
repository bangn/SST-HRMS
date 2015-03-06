class State < ActiveRecord::Base
  has_many :jobs
  
  scope :COMPLETED, -> {where(name: "Completed")}
  scope :IN_PROGRESS, -> {where(name: "In Progress")}
  scope :OPENED, -> {where(name: "Opened")}  
end