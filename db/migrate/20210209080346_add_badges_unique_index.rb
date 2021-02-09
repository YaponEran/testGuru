class AddBadgesUniqueIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :badges, :color, unique: true
    add_index :badges, [:rule, :rule_value], unique: true
  end
end
