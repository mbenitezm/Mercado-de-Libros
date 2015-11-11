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
end
