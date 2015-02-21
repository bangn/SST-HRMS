class Team < ActiveRecord::Base
  paginates_per 10
  validates :name, presence: true, length: {minimum: 6}
end