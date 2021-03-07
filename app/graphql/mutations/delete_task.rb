# frozen_string_literal: true
module Mutations
  # DeleteTask
  class DeleteTask < PrivateMutation
    field :task, Types::TaskType, null: false

    argument :task_id, ID, required: true

    def resolve(args)
      task = Task.find(args[:task_id])
      task.destroy!
      { task: task }
    end
  end
end
