class User < ApplicationRecord
	has_secure_password
	has_many :tasks
	enum role: [:normal,:admin]
	enum paymentstatus: [:regular, :premium]
end
