class Professional < ApplicationRecord
    #paperclip
    has_attached_file :picture, styles: { medium: "541x504>", thumb: "100x93>" }, default_url: "/professional/professionaldefault_:style.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
