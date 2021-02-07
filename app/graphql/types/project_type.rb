module Types
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :creator, AccountType, null: true
    field :tasks, [TaskType], null: true
    field :created_at, DateTimeType, null: false
    field :updated_at, DateTimeType, null: false
  end
end
