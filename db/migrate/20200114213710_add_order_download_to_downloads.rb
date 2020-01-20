class AddOrderDownloadToDownloads < ActiveRecord::Migration[5.1]
  def change
    add_column :downloads, :order_download, :integer
  end
end
