class HomeController < ApplicationController
	before_action :require_login
	
	def welcome
	end

	private
	def require_login
		redirect_to login_path 	if !current_user
	end
end