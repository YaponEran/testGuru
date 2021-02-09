class CreateJoinTableUsersBadges < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :badges do |t|
      t.index [:badge_id, :user_id]
    end
  end
end
