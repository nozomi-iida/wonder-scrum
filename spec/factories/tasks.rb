# frozen_string_literal: true
FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "task#{n}" }
    state { 'to_do' }
    closed { false }

    trait :with_assignees do
      before(:create) do |task|
        task.assignees << build_list(:account, 3)
      end
    end

    association :creator, factory: :account
    association :project
  end
end
