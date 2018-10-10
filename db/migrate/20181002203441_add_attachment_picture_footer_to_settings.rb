class AddAttachmentPictureFooterToSettings < ActiveRecord::Migration[5.1]
  def self.up
    change_table :settings do |t|
      t.attachment :picture_footer
    end
  end

  def self.down
    remove_attachment :settings, :picture_footer
  end
end
