class AddAttachmentPictureToHealthInsurances < ActiveRecord::Migration[5.1]
  def self.up
    change_table :health_insurances do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :health_insurances, :picture
  end
end
