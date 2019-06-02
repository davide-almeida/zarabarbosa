class CreateQuestionCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :question_courses do |t|
      t.string :query
      t.string :answer
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
