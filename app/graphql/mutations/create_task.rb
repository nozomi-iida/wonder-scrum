# frozen_string_literal: true
module Mutations
  # CreateTask
  class CreateTask < PrivateMutation
    field :task, Types::TaskType, null: false

    argument :name, String, required: true
    argument :state, Types::Enums::TaskState, required: true
    argument :assignee_ids, [ID], required: false, loads: Types::AccountType
    argument :project_id, ID, required: true, loads: Types::ProjectType

    def resolve(args)
      task = Task.create!(args.merge(creator: current_account))
      { task: task }
    end
  end
end
