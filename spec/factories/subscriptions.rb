# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    customer { nil }
    tea { nil }
    title { "Tea Subscription" }
    price { "9.99" }
    frequency { "Monthly" }
  end
end
