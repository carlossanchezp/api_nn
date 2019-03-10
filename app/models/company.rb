class Company < ApplicationRecord

  # Validations
  validates :name, presence: true
  validates :description, presence: true


end
