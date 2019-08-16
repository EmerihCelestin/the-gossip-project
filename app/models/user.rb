class User < ApplicationRecord
	belongs_to :city
	has_many :gossips
	has_many :comments
	has_many :likes
	has_secure_password
	validates :password, 
		presence: true,
		length: {minimum: 6 }
	validates :password_confirmation, 
		presence: true
		
  validates :first_name, :last_name, :description, :city, presence: true
  validates :age,
  	presence: true, numericality: true	
	validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" } 

end
