module Mutations
  # UpdateAccount
  class UpdateAccount < BaseMutation
    field :account, Types::AccountType, null: false

    argument :id, ID, required: true
    argument :username, String, required: false
    argument :email, String, required: false

    def resolve(**args)
      account = Account.find(args[:id])
      byebug
      account.update!(username: args[:username], email: args[:email])
      { account: account }
    end
  end
end
