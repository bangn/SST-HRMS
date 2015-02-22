class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name, :null => false
      t.date :start_date
      t.date :end_date
      t.float :total_hours
      
      t.timestamps
    end
  end
end
