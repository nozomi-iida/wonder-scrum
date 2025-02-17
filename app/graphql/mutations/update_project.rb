# frozen_string_literal: true
module Mutations
  # UpdateProject
  class UpdateProject < PrivateMutation
    field :project, Types::ProjectType, null: false

    argument :project_id, ID, required: true
    argument :title, String, required: true

    def resolve(args)
      project = Project.find(args[:project_id])
      project.update!(args.except(:project_id))
      { project: project }
    end
  end
end
