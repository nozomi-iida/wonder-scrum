# frozen_string_literal: true
module Mutations
  # CreateTask
  class CreateTask < BaseMutation
    field :task, Types::TaskType, null: false

    argument :name, String, required: true
    argument :state, Types::Enums::TaskState, required: true
    argument :closed, Boolean, required: true

    def resolve(args)
      task = Task.create!(args.merge(creator: Account.find('9a444050-bd61-4a39-8e29-b933f88fb76d')))
      { task: task }
    end
  end
end
