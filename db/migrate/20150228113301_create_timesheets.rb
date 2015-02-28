class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.text :description
      t.date :working_date
      t.float :duration

      t.timestamps
    end
  end
end
