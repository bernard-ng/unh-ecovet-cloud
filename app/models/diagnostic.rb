class Diagnostic < ApplicationRecord
  belongs_to :animal

  scope :belonging_to_user, ->(user_id) {
    joins(animal: { farm: :user }).where(farms: { user_id: user_id })
  }

  scope :count_for_user, ->(user_id) {
    joins(animal: { farm: :user }).where(farms: { user_id: user_id }).count
  }
end
