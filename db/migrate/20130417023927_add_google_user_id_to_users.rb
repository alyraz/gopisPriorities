class AddGoogleUserIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :google_id, :string
  end
 
  def down
  end
end
