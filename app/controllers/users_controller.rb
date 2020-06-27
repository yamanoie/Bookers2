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
		@new_book = Book.new
		@books = @user.books
	end
	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:sucess_message] = "You have updated user successfully"
			redirect_to user_path(current_user)
		else
			render :edit
		end
	end

private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
