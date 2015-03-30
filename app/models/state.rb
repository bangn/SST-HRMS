class State < ActiveRecord::Base
  has_many :jobs
  
  TYPES = {
    :opened => 1,
    :in_progress => 2,
    :completed => 3
  }

  LEAVE_TYPE = {
    :new => "new",
    :approved => "approved"
  }
end
