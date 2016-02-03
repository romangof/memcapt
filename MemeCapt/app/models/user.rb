class User < ActiveRecord::Base
	has_many :images
	has_many :likes, through: :images
end
