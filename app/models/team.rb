class Team < ActiveRecord::Base
  paginates_per 10
  auto_strip_attributes :name, :squish => true
  validates :name, uniqueness: true
  validates :name, presence: true, length: {minimum: 3}
end