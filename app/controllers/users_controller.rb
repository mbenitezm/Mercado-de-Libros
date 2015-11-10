class UsersController < ApplicationController
  before_action :require_login
	
	private
	def require_login
		redirect_to login_path 	if !current_user
	end
end
