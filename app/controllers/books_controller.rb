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
  def search
    @book = Book.new
  end

  def search_result
    if !params[:book]
      redirect_to search_book_path
    else
      name = params[:book][:name]
      @books = Book.search(name).where(transacting: false)
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
    if current_user != book.owner && !current_user.admin
      flash[:error] = 'You are not allowed to visit this page'
      redirect_to root_path
    end
  end
end
