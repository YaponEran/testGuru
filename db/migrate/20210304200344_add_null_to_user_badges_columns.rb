class AddNullToUserBadgesColumns < ActiveRecord::Migration[6.0]
  def change
    change_column_null :user_badges, :badge_id, false
    change_column_null :user_badges, :user_id, false
  end
end
