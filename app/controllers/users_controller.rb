class UsersController < ApplicationController
	def new
	end
	def create
	end
	def index
		@users = User.all
		@book = Book.new
		@user = current_user
	end
	def show
		@user = User.find(params[:id])
		@book = Book.new
	end
	def edit
	end
end
