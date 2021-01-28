class CreateTestAlternatives < ActiveRecord::Migration[5.1]
  def change
    create_table :test_alternatives do |t|
      t.string :title
      t.float :rank_point
      t.references :test_question, foreign_key: true

      t.timestamps
    end
  end
end
