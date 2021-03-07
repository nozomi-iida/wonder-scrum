# frozen_string_literal: true
module Mutations
  # UpdateProjectMembership
  class UpdateProjectMembership < BaseMutation
    field :projectMemberShip, Types::ProjectMembershipType, null: false

    argument :role, Types::Enums::ProjectMembershipRoleType, required: true
    argument :project_membership_id, ID, required: true

    def resolve(args)
      project_membership = ProjectMembership.find(args[:project_membership_id])
      project_membership.update!(args.except(:project_membership_id))
      { project_membership: project_membership }
    end
  end
end
