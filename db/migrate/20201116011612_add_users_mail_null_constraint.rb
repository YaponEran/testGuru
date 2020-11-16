class AddUsersMailNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :mail, false)
  end
end
