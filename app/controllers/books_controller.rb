class BooksController < ApplicationController
	def create
		@new_book = Book.new(book_params)
		@new_book.user_id = current_user.id
		@new_book.save
		redirect_to books_path
	end
	def index
		@books = Book.all
		@new_book = Book.new
		@user = current_user
	end
	def show
		@book = Book.find(params[:id])
		@new_book =Book.new
		@user = @book.user
	end
	def edit
	end
	def update
	end
	def destroy
	end

private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
