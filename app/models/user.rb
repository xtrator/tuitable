class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :liked_tweets, through: :likes, source: :tweet

  validates :username, :name, :password, presence: true
  validates :username, uniqueness: true

  enum role: { member: 0, admin: 1 }

  has_secure_token

  def invalidate_token
    update(token: nil)
  end
end
