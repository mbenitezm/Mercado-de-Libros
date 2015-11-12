class ExchangesController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    book = Book.find(params[:book_id])
    if book.owner == current_user
      deny_creation(book)
    else
      exchange = Exchange.new(book: book, owner: book.owner, 
          interested: current_user)
      if exchange.save
        change_book_state(book)
        flash[:notice] = "Book added to your transactions"
        redirect_to show_book_path(book)
      else
        deny_creation
      end
  	end
  end

  def show
    exchange = Exchange.find(params[:id])
    check_users_show(exchange)
    @owner = exchange.owner
    @interested = exchange.interested
    @messages = Message.where(exchange: exchange)
    @exchange = exchange
  end

  def finish
    exchange = Exchange.find(params[:book_id])
    check_users_finish(exchange)
    exchange.update(finished: true)
    flash[:notice] = "Transaction ended"
    redirect_to my_account_path(exchange.owner)
  end

  private
  def require_login
    redirect_to login_path 	if !current_user
  end

  def deny_creation(book)
    flash[:error] = "You cannot transact your own books"
    redirect_to show_book_path(book)
  end

  def change_book_state(book)
    book.transacting = !book.transacting
    book.save
  end

  def check_users_show(exchange)
    if current_user != exchange.owner && current_user != exchange.interested
      flash[:error] = "You cannot access this page"
      redirect_to root_path
    end
  end

  def check_users_finish(exchange)
    if current_user != exchange.owner
      flash[:error] = "You cannot access this page"
      redirect_to root_path
    end
  end
end
