require 'bcrypt'
class User < ActiveRecord::Base
  acts_as_paranoid

  include BCrypt

  has_many :books, inverse_of: :user, dependent: :destroy
  has_many :messages, inverse_of: :user, dependent: :destroy
  has_many :owning_exchanges, foreign_key: 'owner_id', class_name: 'Exchange',
      dependent: :destroy
  has_many :interested_exchanges, foreign_key: 'interested_id', 
      class_name: 'Exchange', dependent: :destroy
  
  validates :fullname, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true, on: :update
  validates :password, presence: true
  validates_confirmation_of :password

  acts_as_reader

  attr_accessor :password 
  attr_accessor :password_confirmation

  def is_admin?
    admin
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end