module Mutations
  class InviteProjectMembership < PrivateMutation
    field :projectMembership, Types::ProjectMembershipType, null: false

    argument :role, Types::Enums::ProjectMembershipRoleType, required: true
    argument :project_id, ID, required: true
    argument :account_id, ID, required: true

    def resolve(args)
      projectMembership = ProjectMembership.create!(args)
      { projectMembership: projectMembership }
    end
  end
end
