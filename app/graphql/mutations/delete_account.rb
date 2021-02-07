# frozen_string_literal: true
module Mutations
  # DeleteAccount
  class DeleteAccount < BaseMutation
    field :account, Types::AccountType, null: false

    argument :account_id, ID, required: true

    def resolve(args)
      account = Account.find(args[:account_id])
      account.destroy!
      {
        account: account
      }
    end
  end
end
