class CreateTestResults < ActiveRecord::Migration[5.1]
  def change
    create_table :test_results do |t|
      t.string :condition
      t.float :rank_point_limit
      t.text :description
      t.references :psi_test, foreign_key: true

      t.timestamps
    end
  end
end
