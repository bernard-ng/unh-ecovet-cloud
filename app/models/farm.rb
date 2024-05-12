class Farm < ApplicationRecord
  belongs_to :user
  has_many :animals, inverse_of: :farm

  validates :name, :address, :area, presence: true
end
