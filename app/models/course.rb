class Course < ApplicationRecord
  belongs_to :category_course

  has_one :check_advantage, dependent: :destroy

  has_many :testimonials, dependent: :destroy
  has_many :question_courses, dependent: :destroy

  accepts_nested_attributes_for :testimonials, :question_courses, allow_destroy: true
  accepts_nested_attributes_for :check_advantage, allow_destroy: true

  #paperclip
  has_attached_file :introduction_image, styles: { medium: "295x43>", thumb: "100x15>" }, default_url: "/settings/logoheaderdefault_:style.png"
  validates_attachment_content_type :introduction_image, content_type: /\Aimage\/.*\z/

  #friendly_id
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed? || super
    #new_record?
  end
end
