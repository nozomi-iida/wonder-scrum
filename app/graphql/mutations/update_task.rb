module Mutations
  # UpdateTask
  class UpdateTask < BaseMutation
    field :task, Types::TaskType, null: false

    argument :id, ID, required: true
    argument :name, String, required: false
    argument :state, Types::Enums::TaskState, required: false
    argument :closed, Boolean, required: false

    def resolve(task:, **args)
      task.update!(args)
      { task: task}
    end
  end
end
