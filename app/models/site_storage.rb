class SiteStorage < ApplicationRecord

    #paperclip
    has_attached_file :annex, default_url: "/backoffice/site_storagedefault_:style.png"
    # validates_attachment_content_type :annex, content_type: /\Aimage\/.*\z/
    validates_attachment_content_type :annex, content_type: ["application/pdf", "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain", /\Aimage\/.*\z/ ]

end
