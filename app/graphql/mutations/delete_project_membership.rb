module Mutations
  class DeleteProjectMembership < PrivateMutation
    field :project_membership, Types::ProjectMembershipType, null: false

    argument :project_membership_id, ID, required: true

    def resolve(args)
      project_membership = ProjectMembership.find(args[:project_membership_id])
      project_membership.destroy!
      {project_membership: project_membership}
    end
  end
end
