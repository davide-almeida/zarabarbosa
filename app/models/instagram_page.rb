class InstagramPage < ApplicationRecord
    has_many :instagram_links, dependent: :destroy
    accepts_nested_attributes_for :instagram_links, allow_destroy: true
end
