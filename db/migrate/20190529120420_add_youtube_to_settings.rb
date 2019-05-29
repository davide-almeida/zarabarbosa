class AddYoutubeToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :youtube, :string
  end
end
