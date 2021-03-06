# frozen_string_literal: true

module Types
  # ProjectType
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :creator, AccountType, null: false
    field :tasks, [TaskType], null: true
    field :created_at, DateTimeType, null: false
    field :updated_at, DateTimeType, null: false
  end
end
