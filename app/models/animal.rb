class Animal < ApplicationRecord
  belongs_to :farm

  validates :gender, :race , presence: true
end
