class Service < ApplicationRecord
    #paperclip
    has_attached_file :picture, styles: { medium: "270x248>", thumb: "100x100>" }, default_url: "/services/servicedefault_:style.jpg"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
