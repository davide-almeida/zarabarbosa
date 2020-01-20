class AddAttachmentPictureToDownloads < ActiveRecord::Migration[5.1]
  def self.up
    change_table :downloads do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :downloads, :picture
  end
end
