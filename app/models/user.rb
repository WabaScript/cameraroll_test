class User < ApplicationRecord
  include Clearance::User
  has_many :albums
  has_one_attached :image

  # users can have followers
  has_many :following_users, foreign_key: :followee_id, class_name: 'Relationship'  
  has_many :followers, through: :following_users

  # users can follow who they want
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Relationship'
  has_many :followees, through: :followed_users
  
  validates :email, presence: true, uniqueness: true

  def gain_follower(current_user)
    self.followers.push(current_user)
  end
end
