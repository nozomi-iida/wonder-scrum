# frozen_string_literal: true
module Types
  module Enums
    # TaskState
    class TaskState < Types::BaseEnum
      value 'TO_DO', value: 'to_do'
      value 'THIS_WEEK', value: 'this_week'
      value 'TODAY', value: 'today'
      value 'DOING', value: 'doing'
      value 'DONE', value: 'done'
    end
  end
end
