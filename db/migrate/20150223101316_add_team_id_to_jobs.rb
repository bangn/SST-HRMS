class AddTeamIdToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :team, index: true
  end
end
