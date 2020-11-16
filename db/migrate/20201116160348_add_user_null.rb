class AddUserNull < ActiveRecord::Migration[6.0]
  def change
    change_column(:users, :username, false)
    change_column(:users, :email, false)
    change_column(:users, :password, false)
  end
end
