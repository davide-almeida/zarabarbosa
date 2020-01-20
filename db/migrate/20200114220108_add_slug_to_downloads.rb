class AddSlugToDownloads < ActiveRecord::Migration[5.1]
  def change
    add_column :downloads, :slug, :string
  end
end
