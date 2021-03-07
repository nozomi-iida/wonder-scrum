# frozen_string_literal: true
FactoryBot.define do
  factory :project do
    title { 'Test project' }

    association :creator, factory: :account
  end
end
