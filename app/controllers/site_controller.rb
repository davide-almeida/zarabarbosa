class SiteController < ApplicationController
	before_action { :first_time_visit }

	layout 'site'
end