class BlogController < ApplicationController
    before_action { :first_time_visit }
    
    layout 'blog'
end