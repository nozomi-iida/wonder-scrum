# frozen_string_literal: true
module Types
  # QueryType
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_accounts, [AccountType], null: false

    def all_accounts
      Account.all
    end
  end
end
