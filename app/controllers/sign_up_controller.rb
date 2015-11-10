class SignUpController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(object_params)
		if @user.save
			setup_session
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def object_params
		params.require(:user).permit(:fullname, :email, :phone, 
				:password, :password_confirmation)
	end

	def setup_session
		session[:user] = params[:user][:email]
	end
end
