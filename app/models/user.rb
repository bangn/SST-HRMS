class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  paginates_per 10
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true, length: {minimum: 8}

  def full_name
    "#{first_name} #{last_name}"
  end
end
