class User < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	has_secure_password

	validates :name, :email, presence: true, uniqueness: true
	validates :email, format: { with: VALID_EMAIL_REGEX } 
	validates :password, presence: true, length: {minimum: 8}

	
end
