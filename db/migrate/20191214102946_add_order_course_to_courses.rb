class AddOrderCourseToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :order_course, :integer
  end
end
