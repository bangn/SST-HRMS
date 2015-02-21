class Team < ActiveRecord::Base
  paginates_per 10
  validates :name, uniqueness: true
  validates :name, presence: true, length: {minimum: 3}
end