class RemoveUsernameFromUser < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :username
  end
end
