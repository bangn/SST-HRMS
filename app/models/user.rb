class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable
  paginates_per 10
  validates :password_confirmation, presence: true, length: {minimum: 8}, :if => :password_required?
  belongs_to :team

  def full_name
    full_name = "#{first_name} #{last_name}"
    
    full_name.strip.empty? ? "Unknown" : full_name
  end
end
