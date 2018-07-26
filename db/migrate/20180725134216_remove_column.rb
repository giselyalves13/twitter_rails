class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
  	remove_column :tweets, :user
  	remove_column :tweets, :user_img
  end
end
