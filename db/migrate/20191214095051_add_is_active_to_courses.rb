class AddIsActiveToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :is_active, :string
  end
end
