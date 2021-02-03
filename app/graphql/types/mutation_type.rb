# frozen_string_literal: true

module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :create_account, mutation: Mutations::CreateAccount, null: false
  end
end
