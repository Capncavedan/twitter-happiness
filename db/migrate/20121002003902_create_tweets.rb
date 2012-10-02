class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content
      t.integer :happiness
      t.integer :city_id
      t.timestamps
    end
  end
end
