# frozen_string_literal: true

class Animal < ApplicationRecord
  belongs_to :farm
  has_many :diagnostics, dependent: :delete_all
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200], preprocess: false
  end

  validates :gender, :race, presence: true

  scope :belonging_to_user, lambda { |user_id|
    joins(farm: :user).where(farms: { user_id: }).order(created_at: :desc)
  }

  scope :count_for_user, lambda { |user_id|
    joins(farm: :user).where(users: { id: user_id }).count
  }
end
