module Mutations
  # CreateProject
  class CreateProject < BaseMutation
    field :project, Types::ProjectType, null: false

    argument :title, String, required: true
    argument :account_id, ID, required: false

    def resolve(args)
      project = Project.create!(args)
      {project: project}
    end
  end
end
