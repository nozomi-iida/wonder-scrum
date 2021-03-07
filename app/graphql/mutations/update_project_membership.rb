module Mutations
  class UpdateProjectMembership < BaseMutation
    field :projectMemberShip, Types::ProjectMembershipType, null: false

    argument :role, Types::Enums::ProjectMembershipRoleType, required: true
    argument :project_membership_id, ID, required: true

    def resolve(args)
      projectMemberShip = ProjectMembership.find(args[:project_membership_id])
      projectMemberShip.update!(args.except(:project_membership_id))
      { project_membership: projectMemberShip }
    end
  end
end
