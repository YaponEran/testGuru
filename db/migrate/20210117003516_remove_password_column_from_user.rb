class RemovePasswordColumnFromUser < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :password
  end
end
