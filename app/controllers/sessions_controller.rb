class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.password == params[:sessions][:password]
      setup_session
      redirect_to root_path
    else
     flash[:error] = 'Wrong credentials, please try again'
     redirect_to login_path
   end
 end

  def destroy
    reset_session
    redirect_to login_path
  end
  
  private
  def setup_session
    session[:user] = params[:sessions][:email]
  end
end