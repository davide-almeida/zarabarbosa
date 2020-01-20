class CreateDownloads < ActiveRecord::Migration[5.1]
  def change
    create_table :downloads do |t|
      t.string :title
      t.text :description
      t.references :download_category, foreign_key: true

      t.timestamps
    end
  end
end
