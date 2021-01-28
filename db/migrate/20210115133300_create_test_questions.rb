class CreateTestQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :test_questions do |t|
      t.string :title
      t.references :psi_test, foreign_key: true

      t.timestamps
    end
  end
end
