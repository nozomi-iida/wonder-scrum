# frozen_string_literal: true
module Types
  # Account
  class AccountType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: true
    field :email, String, null: true
  end
end
