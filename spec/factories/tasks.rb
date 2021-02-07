# frozen_string_literal: true
FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "task#{n}" }
    closed { false }

    association :account
  end
end
