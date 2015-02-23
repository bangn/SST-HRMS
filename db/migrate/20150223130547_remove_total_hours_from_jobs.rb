class RemoveTotalHoursFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :total_hours
  end
end
