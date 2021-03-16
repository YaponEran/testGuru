class DropTableBadges < ActiveRecord::Migration[6.0]
  def change
    drop_table :badges
  end
end
