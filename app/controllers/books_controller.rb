class BooksController < ApplicationController
	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
		book.save
		redirect_to books_path
	end
	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end
	def show
		@book = Book.find(params[:id])
		@book_new =Book.new
	end
	def edit
	end
	def destroy
	end

private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
