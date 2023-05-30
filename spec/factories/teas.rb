# frozen_string_literal: true

FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { "Boiling" }
    brew_time { "5 minutes" }
  end
end
