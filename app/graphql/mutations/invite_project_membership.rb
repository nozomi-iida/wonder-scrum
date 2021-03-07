# frozen_string_literal: true
module Mutations
  # InviteProjectMembership
  class InviteProjectMembership < PrivateMutation
    field :projectMembership, Types::ProjectMembershipType, null: false

    argument :role, Types::Enums::ProjectMembershipRoleType, required: true
    argument :project_id, ID, required: true
    argument :account_id, ID, required: true

    def resolve(args)
      project_membership = ProjectMembership.create!(args)
      { project_membership: project_membership }
    end
  end
end
