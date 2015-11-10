class ExchangeUser < ActiveRecord::Base
	acts_as_paranoid

	belongs_to :user, inverse_of: :exchange_users
	belongs_to :exchange, inverse_of: :exchange_users
end