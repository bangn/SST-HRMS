class Leave < ActiveRecord::Base
  paginates_per 10
  belongs_to :user

  before_save {|leave| leave.leave_type = leave.leave_type.downcase}
end

