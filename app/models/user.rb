class User < ApplicationRecord
  include Clearance::User
  validates :email, presence: true, uniqueness: true
  has_one_attached :image
end
