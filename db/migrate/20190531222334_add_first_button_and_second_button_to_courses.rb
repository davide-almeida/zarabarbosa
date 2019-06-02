class AddFirstButtonAndSecondButtonToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :firstbutton, :string
    add_column :courses, :secondbutton, :string
  end
end
