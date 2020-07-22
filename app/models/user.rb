class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  validates :name, presence: true ,length: {in: 2..20 }
  validates :introduction, length: {maximum: 50 }

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def self.search(search,word)
    if search == "match"
      User.where("name LIKE?","#{word}")
    elsif search == "forward"
      User.where("name LIKE?","#{word}%")
    elsif search == "backward"
      User.where("name LIKE?","%#{word}")
    elsif search == "partical"
      User.where("name LIKE?","%#{word}%")
    else
      User.all
    end
  end
end
