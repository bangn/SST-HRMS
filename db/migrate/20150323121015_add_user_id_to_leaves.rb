class AddUserIdToLeaves < ActiveRecord::Migration
  def change
    add_reference :leaves, :user, index: true
  end
end
