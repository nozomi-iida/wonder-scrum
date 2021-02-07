# frozen_string_literal: true

module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :delete_account, mutation: Mutations::DeleteAccount
    field :update_account, mutation: Mutations::UpdateAccount
    field :create_account, mutation: Mutations::CreateAccount

    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :delete_task, mutation: Mutations::DeleteTask
  end
end
