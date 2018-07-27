class User < ApplicationRecord
	has_many :tweets, dependent: :destroy
	has_secure_password
	validates :user, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
 	validates :password_digest, confirmation: true, presence: true, length: {minimum: 4}
 	validates :password_confirmation, presence: true 
    before_save { self.user = user.downcase }

end
