module ApplicationHelper

    def instagram_pages_count
        @instagram_pages_counter = InstagramPage.count
    end

    def instagram_links_count
        @instagram_links_counter = InstagramLink.count
    end
    
end
