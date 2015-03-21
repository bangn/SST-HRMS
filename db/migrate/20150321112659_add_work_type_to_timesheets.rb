class AddWorkTypeToTimesheets < ActiveRecord::Migration
  def change
    add_column :timesheets, :work_type, :string
  end
end
