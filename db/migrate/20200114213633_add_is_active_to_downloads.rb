class AddIsActiveToDownloads < ActiveRecord::Migration[5.1]
  def change
    add_column :downloads, :is_active, :string
  end
end
