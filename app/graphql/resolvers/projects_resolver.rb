# frozen_string_literal: true
module Resolvers
  # ProjectResolver
  class ProjectsResolver < BaseResolver
    type [Types::ProjectType], null: false

    def resolve
      creator = Account.find(current_account.id)
      creator.projects
    end
  end
end
