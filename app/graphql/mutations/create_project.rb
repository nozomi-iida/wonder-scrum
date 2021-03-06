# frozen_string_literal: true
module Mutations
  # CreateProject
  class CreateProject < PrivateMutation
    field :project, Types::ProjectType, null: false

    argument :title, String, required: true

    def resolve(args)
      project = Project.create!(args.merge(creator: current_account))
      { project: project }
    end
  end
end
