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
  
  alias_attribute :name, :email

  def full_name
    full_name = "#{first_name} #{last_name}"
    
    full_name.strip.empty? ? "Unknown" : full_name
  end
  
  def description
    team = Team.find_by_id(team_id)
    team_name = team.nil? ? "Unknown" : team.name
    "ID: #{id} - #{full_name} - #{team_name}"
  end
end
