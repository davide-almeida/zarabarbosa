class CreatePsiTests < ActiveRecord::Migration[5.1]
  def change
    create_table :psi_tests do |t|
      t.string :title
      t.integer :is_active

      t.timestamps
    end
  end
end
