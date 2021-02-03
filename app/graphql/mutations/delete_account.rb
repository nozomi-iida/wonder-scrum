module Mutations
  class DeleteAccount < BaseMutation
    field :account, Types::AccountType, null: false

    argument :id, ID, required: true

    def resolve(args)
      account = Account.find(args[:id])
      account.destroy!
      {
        account: account,
      }
    end
  end
end
