# frozen_string_literal: true
module Types
  # TaskType
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :state, Enums::TaskState, null: false
    field :closed, Boolean, null: false
    field :creator, AccountType, null: false
    field :created_at, Types::DataTimeType, null: false
    field :updated_at, Types::DataTimeType, null: false
  end
end
