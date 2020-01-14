class AddAttachmentAnnexToSiteStorages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :site_storages do |t|
      t.attachment :annex
    end
  end

  def self.down
    remove_attachment :site_storages, :annex
  end
end
