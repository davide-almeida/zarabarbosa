class CreateInstagramPages < ActiveRecord::Migration[5.1]
  def change
    create_table :instagram_pages do |t|
      t.string :title
      t.string :footer

      t.timestamps
    end
  end
end
