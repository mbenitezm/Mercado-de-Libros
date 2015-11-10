class Message < ActiveRecord::Base
	acts_as_paranoid

	belongs_to :user, inverse_of: :messages
	belongs_to :exchange, inverse_of: :messages

	validates :text, presence: true
end