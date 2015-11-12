class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && !user.blocked && user.password == params[:sessions][:password]
      setup_session
      check_notifications
      if @owning_notifications.count > 0 || @interested_notifications.count > 0
      flash[:info] = "You have new transactions or message!"
      end
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

  def check_notifications
    @owning_notifications = Exchange.where(owner: current_user).
        unread_by(current_user)
    @interested_notifications = Exchange.where(interested: current_user).
        unread_by(current_user)
  end
end