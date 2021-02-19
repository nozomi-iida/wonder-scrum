# frozen_string_literal: true

module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :sign_up_account, mutation: Mutations::SignUpAccount
    field :sign_in_account, mutation: Mutations::SignInAccount
    field :update_account, mutation: Mutations::UpdateAccount
    field :delete_account, mutation: Mutations::DeleteAccount

    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :delete_task, mutation: Mutations::DeleteTask

    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :delete_project, mutation: Mutations::DeleteProject
  end
end
