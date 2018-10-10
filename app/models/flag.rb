class Flag < ApplicationRecord
    #paperclip
    has_attached_file :picture, styles: { medium: "1920x748>", thumb: "100x100>" }, default_url: "/banners/bannerdefault_:style.jpg"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
