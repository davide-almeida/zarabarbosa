class PsiTest < ApplicationRecord
    enum is_active: [ "Ativo", "Inativo" ]

    has_many :test_questions, dependent: :destroy
    has_many :test_emails, dependent: :destroy
    has_many :test_results, dependent: :destroy
    
    accepts_nested_attributes_for :test_questions, allow_destroy: true
    accepts_nested_attributes_for :test_emails, allow_destroy: true
    accepts_nested_attributes_for :test_results, allow_destroy: true

    #paperclip
    has_attached_file :picture, styles: { medium: "295x43>", thumb: "100x15>" }, default_url: "/settings/logoheaderdefault_:style.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

    #friendly_id
    extend FriendlyId
    friendly_id :title, use: :slugged
end
