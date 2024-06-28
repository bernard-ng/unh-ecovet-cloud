# frozen_string_literal: true

class User < ApplicationRecord
  has_many :farms, inverse_of: :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  normalizes :email, with: ->(email) { email.strip.downcase }
end
