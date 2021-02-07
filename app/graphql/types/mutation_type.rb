# frozen_string_literal: true

module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :update_task, mutation: Mutations::UpdateTask
    field :create_task, mutation: Mutations::CreateTask
    field :delete_account, mutation: Mutations::DeleteAccount
    field :update_account, mutation: Mutations::UpdateAccount
    field :create_account, mutation: Mutations::CreateAccount
  end
end
