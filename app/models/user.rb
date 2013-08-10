class User < ActiveRecord::Base

  has_many :rounds
  validates :password_hash, presence: true

end


