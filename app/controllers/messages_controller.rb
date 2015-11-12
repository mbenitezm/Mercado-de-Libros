class MessagesController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    exchange = Exchange.find(params[:id])
    message = Message.new(object_params)
    if message.save
      flash[:notice] = "Message added successfuly"
      redirect_to show_exchange_path(exchange)
    end
  end

  private
  def object_params
    params.require(:message).permit(:text, :exchange_id, :user_id)
  end

  def require_login
    redirect_to login_path 	if !current_user
  end
end
