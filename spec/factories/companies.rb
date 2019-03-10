FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "My company #{n}" }
    sequence(:description) { |n| "The description of my company #{n}" }
  end
end
