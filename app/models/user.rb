class User < ApplicationRecord
	has_secure_password
	validates_presence_of :username
	validates_uniqueness_of :username

	def self.authenticate(username, password)
		user = User.find_by(username: username).try(:authenticate, password)
		if user
			user
		else
			nil
		end
	end
end
