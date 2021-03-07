# frozen_string_literal: true
FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "task#{n}" }
    state { "to_do" }
    closed { false }

    association :creator, factory: :account
    association :project
  end
end
