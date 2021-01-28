class AddAttachmentPictureToPsiTests < ActiveRecord::Migration[5.1]
  def self.up
    change_table :psi_tests do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :psi_tests, :picture
  end
end
