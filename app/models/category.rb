class Category < ApplicationRecord
    has_many :posts

    #friendly_id
    extend FriendlyId
    friendly_id :name, use: :slugged

    def should_generate_new_friendly_id?
        name_changed? || super
        #new_record?
    end
end
