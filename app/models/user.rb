class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  normalizes :email, with: -> email { email.strip.downcase }
end
