class AddAccessTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :access_token, :string, null: false
    add_index :users, :access_token, unique: true
  end
end
