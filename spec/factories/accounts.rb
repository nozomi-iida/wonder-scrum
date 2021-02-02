# frozen_string_literal: true
FactoryBot.define do
  factory :account do
    sequence(:username) { |n| "TEST#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
