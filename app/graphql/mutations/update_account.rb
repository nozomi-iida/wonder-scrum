# frozen_string_literal: true
module Mutations
  # UpdateAccount
  class UpdateAccount < PrivateMutation
    field :account, Types::AccountType, null: false

    argument :account_id, ID, required: true
    argument :username, String, required: false
    argument :email, String, required: false

    def resolve(args)
      account = Account.find(args[:account_id])
      account.update!(username: args[:username], email: args[:email])
      { account: account }
    end
  end
end
