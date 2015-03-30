class AddStatusToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :status, :string
  end
end
