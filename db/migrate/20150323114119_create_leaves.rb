class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.datetime :leave_date
      t.float :duration
      t.string :leave_type
      t.text :reason
    end
  end
end
