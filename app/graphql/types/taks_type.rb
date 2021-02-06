module Types
  class TaksType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :status, Enums::TaskStateType, null: false
    field :closed, Boolean, null: false
    field :created_at, Types::DataTimeType, null: false
    field :updated_at, Types::DataTimeType, null: false
  end
end
