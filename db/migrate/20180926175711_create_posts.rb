class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.date :post_date
      t.references :admin, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
