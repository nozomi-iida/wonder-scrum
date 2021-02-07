# frozen_string_literal: true
module Types
  # QueryType
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :tasks, resolver: Resolvers::TasksResolver
  end
end
