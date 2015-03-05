class AddJobIdToTimesheets < ActiveRecord::Migration
  def change
    add_reference :timesheets, :job, index: true
  end
end
