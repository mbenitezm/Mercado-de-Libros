class Book < ActiveRecord::Base
	acts_as_paranoid

	belongs_to :user, inverse_of: :books
	has_one :exchange, dependent: :destroy

	validates :name, presence: true
	validates :price, presence: true
	validates :for_what, presence: true
	validates :image_url, presence: true

	def owner_name
		user.fullname
	end

	def self.on_sale
		where(type: 'sale')
	end

	def self.on_purchase
		where(type: 'purchase')
	end
end