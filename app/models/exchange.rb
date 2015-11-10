class Exchange < ActiveRecord::Base
	acts_as_paranoid

	belongs_to :book
	has_many :messages, inverse_of: :exchange, dependent: :destroy
	has_many :exchange_users, inverse_of: :exchange, dependent: :destroy

	def owner
		exchange_users.first
	end

	def interested
		exchange_users.second
	end
end