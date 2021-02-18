# frozen_string_literal: true
module Resolvers
  # ProjectResolver
  class ProjectsResolver < BaseResolver
    type [Types::ProjectType], null: false

    def resolve
      Project.all
    end
  end
end
