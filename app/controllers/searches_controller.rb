class SearchesController < ApplicationController
	def search
		search = params[:search]
		@range = params[:range]
		@word = params[:word]

		if @range == "user"

			@users = User.search(search,@word)
		else
			@books = Book.search(search,@word)
		end

	end
end
