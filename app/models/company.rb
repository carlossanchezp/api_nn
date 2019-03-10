# frozen_string_literal: true

class Company < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :share_price, presence: true
  validates :ric, presence: true
  validates :country, presence: true

  # Scopes
  scope :recent, -> { order(created_at: :desc) }
end
