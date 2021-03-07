# frozen_string_literal: true
module Mutations
  # UpdateTask
  class UpdateTask < BaseMutation
    field :task, Types::TaskType, null: false

    argument :task_id, ID, required: true
    argument :name, String, required: false
    argument :state, Types::Enums::TaskState, required: false
    argument :assignee_ids, [ID], required: false, loads: Types::AccountType
    argument :closed, Boolean, required: false

    def resolve(args)
      task = Task.find(args[:task_id])
      task.update!(args.except(:task_id))
      { task: task }
    end
  end
end
