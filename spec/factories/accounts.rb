# frozen_string_literal: true
FactoryBot.define do
  factory :account do
    sequence(:username) { |n| "username_#{n}" }
    sequence(:email) { |n| "test_#{n}@example.com" }
    password { 'password' }

    trait :with_projects do
      before(:create) do |account|
        account.projects << build_list(:project, 3)
      end
    end
  end
end
