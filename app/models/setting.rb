class Setting < ApplicationRecord
    enum cookie_active: [ "Ativo", "Inativo" ]
    
    #paperclip
    has_attached_file :picture, styles: { medium: "295x43>", thumb: "100x15>" }, default_url: "/settings/logoheaderdefault_:style.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

    has_attached_file :picture_footer, styles: { medium: "295x43>", thumb: "100x15>" }, default_url: "/settings/logofooterdefault_:style.png"
    validates_attachment_content_type :picture_footer, content_type: /\Aimage\/.*\z/
end
