# frozen_string_literal: true
module Types
  # Account
  class AccountType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :projects, [Project], null: true
    field :tasks, [Task], null: true
  end
end
