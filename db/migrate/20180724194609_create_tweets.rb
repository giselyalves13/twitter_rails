class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :user_img
      t.text :content

      t.timestamps
    end
  end
end
