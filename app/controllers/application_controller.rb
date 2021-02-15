class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	# verify cookies before each action
	before_action :first_time_visit, unless: -> { cookies[:first_visit] }		
	def first_time_visit
		cookies.permanent[:first_visit] = 1
		@first_visit = true
	end

	# Set layout
	layout :layout_by_resource

	
	private
		def layout_by_resource
			if devise_controller? && resource_name == :admin
			"backoffice_devise"
			else
			"application"
			end
		end
end
