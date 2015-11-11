class UsersController < ApplicationController
  before_action :require_login

  def my_account
    user = User.find(params[:id])
    check_user(user)
    @owning_exchanges = Exchange.where(owner: user, finished: false)
    @interested_exchanges = Exchange.where(interested: user, finished: false)
    @finished_owning_exchanges = Exchange.where(owner: user, finished: true)
    @finished_interested_exchanges = Exchange.where(interested: user, 
        finished: true)
    @books_on_display = Book.where(user: user)
  end

  def edit
    @user = User.find(params[:id])
    check_user(@user)
  end

  def update
  end

  private
  def require_login
    redirect_to login_path 	if !current_user
  end

  def check_user(user)
  	if current_user != @user
  		flash[:error] = 'You are not allowed to visit this page'
  		redirect_to root_path
  	end
  end
end
