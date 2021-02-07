# frozen_string_literal: true
module Mutations
  # DeleteTask
  class DeleteTask < BaseMutation
    field :task, Types::TaskType, null: false

    argument :task_id, String, required: true

    def resolve(args)
      task = Task.find(args[:task_id])
      task.destroy!
      { task: task }
    end
  end
end
