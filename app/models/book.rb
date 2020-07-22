class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200 }
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def self.search(search,word)
		# byebug
	    if search == "match"
	    	# Book.where(['name LIKE ?',"%#{word}"])
	      # @book = Book.where("name LIKE?","#{word}")
	      Book.where(['title LIKE ?',"#{word}"])
	    elsif search == "forward"
	       Book.where("title LIKE?","#{word}%")
	    elsif search == "backward"
	      Book.where("title LIKE?","%#{word}")
	    elsif search == "partical"
	       Book.where(["title LIKE?","%#{word}%"])
	    else
	       Book.all
	    end
    end
end
