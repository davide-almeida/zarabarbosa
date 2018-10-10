class AddAttachmentPictureToProfessionals < ActiveRecord::Migration[5.1]
  def self.up
    change_table :professionals do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :professionals, :picture
  end
end
