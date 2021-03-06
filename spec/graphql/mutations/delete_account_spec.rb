# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::DeleteAccount, skip: true do
  subject(:resolver) { described_class.new(object: nil, context: {}, field: nil) }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:account_id).of_type('ID!') }
  end

  it('exist resolver method') { is_expected.to respond_to(:resolve) }

  context 'return correct values' do
    let(:account) { create(:account) }

    it do
      object = resolver.resolve(
        account_id: account.id
      )
      expect(object).to have_key(:account)
      expect(object[:account]).to be_a Account
      expect(object[:account].id).to eq account.id
      expect(object[:account].destroyed?).to eq true
    end
  end
end
