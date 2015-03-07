class Job < ActiveRecord::Base
  belongs_to :team
  belongs_to :state
  
  paginates_per 10
  auto_strip_attributes :name, :squish => true
  validates :name, uniqueness: true
  validates :name, presence: true, length: {minimum: 4}
  validates :start_date, :presence => {:message => "should be presented!"}, :if => "end_date.present?"
  validates :end_date, :presence => {:message => "should be presented!"}, :if => "state == State.COMPLETED.first"
  validate :validate_job_time_range
  validate :validate_job_status, :if => "end_date.present?"
  
  def description
    team_name = team.nil? ? "Unknown" : team.name
    "ID: #{id} - #{team_name} -#{state.name if state}"
  end
  
  def validate_job_time_range
    if start_date && end_date && (start_date > end_date)
      errors.add(:end_date, 'should be on the same day as start date or in the future')
    end
  end
  
  def validate_job_status
    if state != State.COMPLETED.first
      errors.add(:state, 'should be completed!')
    end
  end
end