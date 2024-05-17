class Animal < ApplicationRecord
  belongs_to :farm

  validates :gender, :race , presence: true

  scope :belonging_to_user, ->(user_id) {
    joins(farm: :user).where(farms: { user_id: user_id })
  }

  scope :count_for_user, ->(user_id) {
    joins(farm: :user).where(users: { id: user_id }).count
  }
end
