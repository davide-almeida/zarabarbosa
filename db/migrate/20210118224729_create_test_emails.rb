class CreateTestEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :test_emails do |t|
      t.string :email
      t.references :psi_test, foreign_key: true

      t.timestamps
    end
  end
end
