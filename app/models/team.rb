class Team < ActiveRecord::Base
  has_many :users
  has_many :jobs
  paginates_per 10
  auto_strip_attributes :name, :squish => true
  validates :name, uniqueness: true
  validates :name, presence: true, length: {minimum: 2}
  
  def details
    "ID: #{id} - #{name}"
  end
end