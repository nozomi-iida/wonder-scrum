# frozen_string_literal: true
module Resolvers
  # TasksResolver
  class TasksResolver < BaseResolver
    type [Types::TaskType], null: false

    def resolve
      Task.all
    end
  end
end
