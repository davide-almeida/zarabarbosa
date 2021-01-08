class CreateInstagramLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :instagram_links do |t|
      t.string :title
      t.string :description
      t.string :link
      t.references :instagram_page, foreign_key: true

      t.timestamps
    end
  end
end
