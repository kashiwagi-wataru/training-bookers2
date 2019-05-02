class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end

  def up
    remove_index :users, :email
   end
  
   def down
    add_index :users, :email, unique: true
   end
end