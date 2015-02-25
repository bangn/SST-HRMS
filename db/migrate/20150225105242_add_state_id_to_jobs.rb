class AddStateIdToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :state, index: true
  end
end
