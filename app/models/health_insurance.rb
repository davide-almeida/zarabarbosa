class HealthInsurance < ApplicationRecord
    #paperclip
    has_attached_file :picture, styles: { medium: "198x204>", thumb: "100x100>" }, default_url: "/healthinsurance/healthinsurancedefault_:style.jpg"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
