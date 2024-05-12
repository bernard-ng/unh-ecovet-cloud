class User < ApplicationRecord
    has_secure_password
  
    validates :email, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :password, presence: true, length: { minimum: 6 }
  
    normalizes :email, with: -> email {email.strip.downcase}
  end
  