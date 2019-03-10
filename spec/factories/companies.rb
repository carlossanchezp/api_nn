# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "My company #{n}" }
    sequence(:ric) { |n| "My Company ric APP #{n}" }
    sequence(:description) { |n| "The description of my company #{n}" }
    sequence(:share_price) { |_n| 3.8 }
    sequence(:country) { |n| "The country of my company #{n}" }
  end
end
