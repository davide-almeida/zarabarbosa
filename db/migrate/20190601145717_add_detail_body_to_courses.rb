class AddDetailBodyToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :detail_body, :text
  end
end
