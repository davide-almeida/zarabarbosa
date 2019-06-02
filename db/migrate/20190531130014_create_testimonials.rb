class CreateTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.text :body
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
