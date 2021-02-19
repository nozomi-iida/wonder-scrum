# frozen_string_literal: true

module Mutations
  # SignInAccount
  class SignInAccount < PublicMutation
    field :account, Types::AccountType, null: false

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(args)
      account = Account.find_by(
        email: args[:email]
      ).try(:authenticate, args[:password])

      return unless account

      {
        account: account,
        token: account.jwt
      }
    end
  end
end
