class User < ActiveRecord::Base
	acts_as_paranoid

	has_many :books, inverse_of: :user, dependent: :destroy
	has_many :messages, inverse_of: :user, dependent: :destroy
	has_many :exchange_users, inverse_of: :user, dependent: :destroy

	validates :fullname, presence: true
  validates :password_hash, presence: true, on: :update
  validates :password_salt, presence: true, on: :update

  def is_admin?
  	admin
  end
  
  private
	def encrypt
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end