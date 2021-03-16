class AddOcticonColumnToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :octicon, :string, null: false
  end
end
