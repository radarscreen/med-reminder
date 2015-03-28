class User < ActiveRecord::Base
	has_secure_password
	has_many :clients, dependent: :destroy
end
