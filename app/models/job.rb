class Job < ActiveRecord::Base
  belongs_to :team
  belongs_to :job
  belongs_to :state
  paginates_per 10
  auto_strip_attributes :name, :squish => true
  validates :name, uniqueness: true
  validates :name, presence: true, length: {minimum: 4}
  validates :start_date, :presence => {:message => "should be presented!"}, :if => "end_date.present?"
  validate :validate_job_time_range
  
  def description
    team_name = team.nil? ? "Unknown" : team.name
    "ID: #{id} - #{team_name} -#{state.name if state}"
  end
  
  def validate_job_time_range
    if start_date && end_date && (start_date > end_date)
      errors.add(:end_date, 'should be on the same day as start date or in the future')
    end
  end
end