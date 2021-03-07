# frozen_string_literal: true
module Mutations
  # DeleteProject
  class DeleteProject < PrivateMutation
    field :project, Types::ProjectType, null: false

    argument :project_id, ID, required: true

    def resolve(args)
      project = Project.find(args[:project_id])
      project.destroy!
      { project: project }
    end
  end
end
