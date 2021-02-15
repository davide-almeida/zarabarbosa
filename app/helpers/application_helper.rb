module ApplicationHelper

    def instagram_pages_count
        @instagram_pages_counter = InstagramPage.count
    end

    def instagram_links_count
        @instagram_links_counter = InstagramLink.count
    end

    # set modal cookies settings
    def cookie_active_nil
		@cookie_active_nil = Setting.first.cookie_active.nil?
	end
    def cookie_active
		if Setting.first.cookie_active == "Ativo"
            @cookie_active = true
        else
            @cookie_active = false
        end
	end
    def cookie_privacy_policy_present
		@cookie_privacy_policy_present = Setting.first.privacy_policy.present?
	end
    
end
