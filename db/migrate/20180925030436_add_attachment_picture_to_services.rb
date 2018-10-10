class AddAttachmentPictureToServices < ActiveRecord::Migration[5.1]
  def self.up
    change_table :services do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :services, :picture
  end
end
