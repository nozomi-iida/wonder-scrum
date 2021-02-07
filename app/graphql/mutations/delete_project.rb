module Mutations
  class DeleteProject < BaseMutation
    field :project, Types::ProjectType, null: false

    argument :project_id, ID, required: true

    def resolve(args)
      project = Project.find(args[:project_id])
      project.destroy!
      { project: project }
    end
  end
end
