class QuestionCourse < ApplicationRecord
  belongs_to :course, optional: true
end
