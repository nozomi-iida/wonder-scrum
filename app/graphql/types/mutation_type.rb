# frozen_string_literal: true

module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :delete_account, mutation: Mutations::DeleteAccount
    field :update_account, mutation: Mutations::UpdateAccount
    field :create_account, mutation: Mutations::CreateAccount, null: false
  end
end
