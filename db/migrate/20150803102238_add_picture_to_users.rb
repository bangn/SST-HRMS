class AddPictureToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :picture
  end
  def down
    remove_attachment :users, :picture
  end
end
