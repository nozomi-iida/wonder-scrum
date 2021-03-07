# frozen_string_literal: true
module Types
  # ProjectMembershipType
  class ProjectMembershipType < Types::BaseObject
    field :role, Types::Enums::ProjectMembershipRoleType, null: false
    field :state, Types::Enums::ProjectMembershipStateType, null: false
    field :account, AccountType, null: false
    field :project, ProjectType, null: false
    field :created_at, DateTimeType, null: false
    field :updated_at, DateTimeType, null: false
  end
end
