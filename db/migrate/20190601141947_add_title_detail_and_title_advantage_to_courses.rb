class AddTitleDetailAndTitleAdvantageToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :title_detail, :string
    add_column :courses, :title_advantage, :string
  end
end
