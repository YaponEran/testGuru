class CreateTestPasts < ActiveRecord::Migration[6.0]
  def change
    create_table :test_pasts do |t|
      t.string :status
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
