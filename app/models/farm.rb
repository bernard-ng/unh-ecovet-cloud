# frozen_string_literal: true

class Farm < ApplicationRecord
  belongs_to :user
  has_many :animals, inverse_of: :farm, dependent: :delete_all

  validates :name, :address, :area, :user, presence: true

  scope :count_for_user, ->(user_id) { where(user_id:).count }
end
