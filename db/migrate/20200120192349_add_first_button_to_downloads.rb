class AddFirstButtonToDownloads < ActiveRecord::Migration[5.1]
  def change
    add_column :downloads, :first_button, :string
  end
end
