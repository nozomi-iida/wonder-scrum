# frozen_string_literal: true
module Resolvers
  # ProjectResolver
  class ProjectsResolver < BaseResolver
    type Types::ProjectType.connection_type, null: false

    def resolve
      current_account.projects
    end
  end
end
