class BooksController < ApplicationController
	before_action :require_login

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(object_params)
		if @book.save
			redirect_to show_book_path(@book)
		else
			render :new
		end
	end

	def show
	end
		
	private
	def object_params
		params.require(:book).permit(:name, :image_url, :year, 
				:edition, :editorial, :user_id, :type, :price)
	end

	def require_login
		redirect_to login_path 	if !current_user
	end
end
