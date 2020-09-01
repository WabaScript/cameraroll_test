class User < ApplicationRecord
  include Clearance::User
  has_many :albums
  validates :email, presence: true, uniqueness: true
  has_one_attached :image
end
