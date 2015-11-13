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
    if params[:user][:password] != "" && params[:user][:password_confirmation]
      if @user.update(object_params)
        flash[:notice] = "Account information changed successfuly"
        redirect_to my_account_path(@user)
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def all_users
    if current_user.admin
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def change_state
    if current_user.admin
      user = User.find(params[:id])
      user.blocked = !user.blocked
      user.save
      redirect_to users_path
    else
      redirect_to root_path
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
