class AddNullToBadgeColumns < ActiveRecord::Migration[6.0]
  def change
    change_column_null :badges, :name, false
    change_column_null :badges, :image, false
    change_column_null :badges, :rule, false
    change_column_null :badges, :parameter, false
  end
end
