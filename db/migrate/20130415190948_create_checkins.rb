class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :user_id
      t.integer :sleep
      t.integer :exercise
      t.integer :nutrition
      t.integer :meditation
      t.integer :love
      t.integer :stuff
      t.integer :work
      t.integer :passion
      t.integer :growth
      t.integer :service
      
      t.timestamps
    end
  end
end
