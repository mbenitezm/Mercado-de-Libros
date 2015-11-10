class Exchange < ActiveRecord::Base
	acts_as_paranoid

	belongs_to :book
	has_many :messages, inverse_of: :exchange, dependent: :destroy
 	belongs_to :owner, class_name: 'User'
 	belongs_to :interested, class_name: 'User'
 
end