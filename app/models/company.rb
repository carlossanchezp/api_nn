class Company < ApplicationRecord

  # Validations
  validates :name, presence: true
  validates :description, presence: true

  # Scopes
  scope :recent, -> { order(created_at: :desc) }

end
