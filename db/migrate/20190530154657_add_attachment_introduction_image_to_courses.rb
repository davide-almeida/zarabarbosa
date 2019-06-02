class AddAttachmentIntroductionImageToCourses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :courses do |t|
      t.attachment :introduction_image
    end
  end

  def self.down
    remove_attachment :courses, :introduction_image
  end
end
