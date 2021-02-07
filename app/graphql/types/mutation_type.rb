# frozen_string_literal: true

module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :delete_project, mutation: Mutations::DeleteProject
    field :update_account, mutation: Mutations::UpdateAccount
    field :create_account, mutation: Mutations::CreateAccount

    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :delete_task, mutation: Mutations::DeleteTask

    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :delete_account, mutation: Mutations::DeleteAccount
  end
end
