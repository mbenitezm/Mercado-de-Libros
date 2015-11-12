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
    @user = User.find(params[:id])
    check_user(@user)
    if @user.update(object_params)
      flash[:notice] = "Account information changed successfuly"
      redirect_to my_account_path(@user)
    else
      render :edit
    end
  end

  private
  def object_params
    params.require(:user).permit(:fullname, :email, :phone, 
        :password, :password_confirmation)
  end

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
