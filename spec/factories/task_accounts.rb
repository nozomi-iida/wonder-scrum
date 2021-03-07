# frozen_string_literal: true
FactoryBot.define do
  factory :task_account do
    association :account
    association :task
  end
end
