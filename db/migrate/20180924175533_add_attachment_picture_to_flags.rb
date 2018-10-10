class AddAttachmentPictureToFlags < ActiveRecord::Migration[5.1]
  def self.up
    change_table :flags do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :flags, :picture
  end
end
