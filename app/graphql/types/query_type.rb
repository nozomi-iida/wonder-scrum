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

    field :account, Types::AccountType, null: false do
      argument :id, ID, required: false
    end
    def account(args)
      Account.find(args[:id])
    end
  end
end
