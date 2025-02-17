# frozen_string_literal: true
FactoryBot.define do
  factory :account do
    sequence(:username) { |n| "username_#{n}" }
    sequence(:email) { |n| "test_#{n}@example.com" }
    password { 'password' }
  end
end
