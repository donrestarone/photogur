class User < ApplicationRecord
	validates :email, presence: true
	validates :password, presence: true

	has_many :pictures
	
	has_secure_password
end
