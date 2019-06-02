class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :price
      t.string :link_sale
      t.string :title
      t.text :description
      t.text :link_video
      t.references :category_course, foreign_key: true

      t.timestamps
    end
  end
end
