class Job < ActiveRecord::Base
  belongs_to :team
  paginates_per 10
  auto_strip_attributes :name, :squish => true
  validates :name, uniqueness: true
  validates :name, presence: true, length: {minimum: 4}
  
  def description
    team = Team.find_by_id(team_id)
    team_name = team.nil? ? "Unknown" : team.name
    "ID: #{id} - #{team_name}"
  end
end