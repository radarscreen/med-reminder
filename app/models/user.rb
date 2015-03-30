class User < ActiveRecord::Base
	has_secure_password
	has_many :clients, dependent: :destroy

	validates :username, uniqueness: true
	validates :password, length: {minimum: 6}
end
