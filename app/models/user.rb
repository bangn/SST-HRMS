class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable
  paginates_per 10
  validates :password_confirmation, presence: true, length: {minimum: 8}, :if => :password_required?
  belongs_to :team
  has_many :timesheets
  has_many :leaves
  
  alias_attribute :name, :email

  def full_name
    full_name = "#{first_name} #{last_name}"
    
    full_name.strip.empty? ? "Unknown" : full_name
  end
  
  def details
    team = Team.find_by_id(team_id)
    team_name = team.nil? ? "Unknown" : team.name
    "ID: #{id} - #{full_name} - #{team_name}"
  end
  
  def available_jobs
    self.team.jobs.where.not(state_id: State::TYPES[:completed]).order(:id) if self.team
  end
end
