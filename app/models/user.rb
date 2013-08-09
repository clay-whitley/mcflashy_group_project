class User < ActiveRecord::Base

  has_many :rounds
  validates :password, presence: true

end


