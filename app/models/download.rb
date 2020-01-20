class Download < ApplicationRecord
  belongs_to :download_category

  #paperclip
  has_attached_file :picture, styles: { large: "840x360>", medium: "370x185>", thumb: "100x93>" }, default_url: "/backoffice/downloaddefault_:style.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  #friendly_id
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed? || super
    #new_record?
  end

end
