class BooksController < ApplicationController
  before_action :require_login

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(object_params)
    @book.user = current_user
      if @book.save
      flash[:notice] = "Book added successfuly"
      redirect_to show_book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def sale_index
    @books = Book.where(for_what: 'sale', transacting: false)
  end

  def purchase_index
    @books = Book.where(for_what: 'purchase', transacting: false)
  end

  def remove
    book = Book.find(params[:id])
    check_user(book)
    if book.destroy
      flash[:notice] = "Book deleted successfuly"
      redirect_to root_path
    end
  end

private
  def object_params
    params.require(:book).permit(:name, :image_url, :year, 
      :edition, :editorial, :user_id, :for_what, :price)
  end

  def require_login
    redirect_to login_path 	if !current_user
  end
  def check_user(book)
    if current_user != book.owner
      flash[:error] = 'You are not allowed to visit this page'
      redirect_to root_path
    end
  end
end
